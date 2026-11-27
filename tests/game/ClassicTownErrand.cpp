/*
 * This file is part of the TrinityCore Project. See AUTHORS file for Copyright information
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */
#include "tc_catch2.h"

#include "../../src/modules/PlayerbotV2/Bot/TownErrand.h"
#include "../../src/modules/PlayerbotV2/Bot/TownErrandConfig.h"

#include <cmath>
#include <set>

using namespace Playerbot::V2::TownErrand;

TEST_CASE("A place takes its cap of bots and no more; a lapsed claim frees the slot", "[ClassicTownErrand]")
{
    Spots spots;
    std::uint64_t const inn = Spots::PlaceKey(0, -8867.f, 673.f);
    std::set<std::uint32_t> slots;
    for (std::uint64_t bot = 1; bot <= 4; ++bot)
    {
        std::uint32_t slot = 99;
        REQUIRE(spots.Claim(inn, bot, 1000u, 30000u, 4u, &slot));
        slots.insert(slot);
    }
    REQUIRE(slots.size() == 4);                                    // each in its own slot
    REQUIRE_FALSE(spots.Claim(inn, 5, 1000u, 30000u, 4u));         // the fifth is turned away
    REQUIRE(spots.Full(inn, 5, 1000u, 4u));
    REQUIRE_FALSE(spots.Full(inn, 2, 1000u, 4u));                  // a holder is never refused its own place
    REQUIRE(spots.Claim(inn, 2, 2000u, 30000u, 4u));               // renewing
    spots.Release(inn, 3);
    std::uint32_t slot = 99;
    REQUIRE(spots.Claim(inn, 5, 3000u, 30000u, 4u, &slot));        // the freed place goes to the next
    REQUIRE(spots.Count(inn, 3000u) == 4);
    // Nobody renews: all lapse, the place is empty again.
    REQUIRE(spots.Count(inn, 40000u) == 0);
    REQUIRE(spots.Claim(inn, 9, 40000u, 30000u, 4u, &slot));
    REQUIRE(slot == 0);
}

TEST_CASE("The bankers of one bank are one place, the bank and the auction house are two", "[ClassicTownErrand]")
{
    REQUIRE(Spots::PlaceKey(0, -8925.f, 613.f) == Spots::PlaceKey(0, -8921.f, 615.f));
    REQUIRE(Spots::PlaceKey(0, -8925.f, 613.f) != Spots::PlaceKey(0, -8815.f, 660.f));
    REQUIRE(Spots::PlaceKey(0, 10.f, 10.f) != Spots::PlaceKey(1, 10.f, 10.f));
}

TEST_CASE("The pick crosses the city, skips full and recent places", "[ClassicTownErrand]")
{
    std::vector<Dest> d = {
        { Kind::Vendor,  1, 0, 10.f, 0.f, 0.f, BaseWeight(Kind::Vendor) },    // next door
        { Kind::Bank,    2, 0, 150.f, 0.f, 0.f, BaseWeight(Kind::Bank) },
        { Kind::Auction, 3, 0, 0.f, 200.f, 0.f, BaseWeight(Kind::Auction) },
        { Kind::Flight,  4, 0, 900.f, 0.f, 0.f, BaseWeight(Kind::Flight) },   // beyond the radius
    };
    Recent recent;
    auto none_full = [](Dest const&) { return false; };
    int counts[4] = {};
    for (int i = 0; i < 1000; ++i)
    {
        int const k = Pick(d, 0.f, 0.f, 300.f, recent, float(i) / 1000.f, none_full);
        REQUIRE(k >= 0);
        ++counts[k];
    }
    REQUIRE(counts[3] == 0);
    REQUIRE(counts[0] < counts[1] / 5);   // next door is rare
    REQUIRE(counts[1] > 0);
    REQUIRE(counts[2] > 0);

    recent.add(2);
    auto bank_full = [](Dest const& x) { return x.key == 3; };
    for (int i = 0; i < 100; ++i)
    {
        int const k = Pick(d, 0.f, 0.f, 300.f, recent, float(i) / 100.f, bank_full);
        REQUIRE(k == 0);   // the bank was just visited, the auction house is full: only the vendor is left
    }
    recent.add(1);
    REQUIRE(Pick(d, 0.f, 0.f, 300.f, recent, 0.5f, bank_full) == -1);
}

TEST_CASE("Bots at one place stand side by side on the near side", "[ClassicTownErrand]")
{
    std::set<std::pair<int, int>> seen;
    for (std::uint32_t slot = 0; slot < 5; ++slot)
    {
        float sx, sy;
        StandPoint(0.f, 0.f, 50.f, 0.f, 4.f, slot, sx, sy);
        REQUIRE(std::hypot(sx, sy) == Catch::Approx(4.f).margin(0.01));
        REQUIRE(sx > 0.f);   // the side the bot comes from
        seen.insert({ int(std::lround(sx * 10.f)), int(std::lround(sy * 10.f)) });
    }
    REQUIRE(seen.size() == 5);
}

TEST_CASE("A place with a facing fans its bots out front; one without uses the approach side", "[ClassicTownErrand]")
{
    float sx, sy;
    // A banker facing east (orientation 0): the queue stands in front, not behind.
    StandPoint(0.f, 0.f, -50.f, 0.f, 4.f, 0, sx, sy, 0.0f);
    REQUIRE(sx > 3.9f);
    REQUIRE(std::fabs(sy) < 0.1f);
    // No facing stored (-1 = none): the side the bot approaches from (+x) is used.
    StandPoint(0.f, 0.f, 50.f, 0.f, 4.f, 0, sx, sy, -1.0f);
    REQUIRE(sx > 3.9f);
    REQUIRE(std::fabs(sy) < 0.1f);
}

TEST_CASE("A walk that stops getting closer is stalled after the window", "[ClassicTownErrand]")
{
    State st;
    REQUIRE_FALSE(Stalled(st, 0.f, 0.f, 1000u));
    REQUIRE_FALSE(Stalled(st, 1.f, 0.f, 5000u));
    REQUIRE_FALSE(Stalled(st, 5.f, 0.f, 8000u));    // 5 y: progress, the clock restarts
    REQUIRE_FALSE(Stalled(st, 5.5f, 0.f, 15000u));
    REQUIRE(Stalled(st, 5.5f, 0.f, 16001u));
}

TEST_CASE("A station's SpellFocusObject name maps to its errand kind", "[ClassicTownErrand]")
{
    REQUIRE(KindForFocusName("Anvil") == Kind::Forge);
    REQUIRE(KindForFocusName("Forge") == Kind::Forge);
    REQUIRE(KindForFocusName("Smelter") == Kind::Forge);
    REQUIRE(KindForFocusName("Furnace") == Kind::Forge);
    REQUIRE(KindForFocusName("Cooking Fire") == Kind::Cookfire);
    REQUIRE(KindForFocusName("Cooking Stove") == Kind::Cookfire);
    REQUIRE(KindForFocusName("Bonfire") == Kind::Cookfire);
    REQUIRE(KindForFocusName("Loom") == Kind::Loom);
    REQUIRE(KindForFocusName("Mana Loom") == Kind::Loom);
    REQUIRE(KindForFocusName("Moonwell") == Kind::Moonwell);
    REQUIRE(KindForFocusName("Alchemy Lab") == Kind::None);      // needs no station in Classic
    REQUIRE(KindForFocusName("Lexicon of Power") == Kind::None);
    REQUIRE(KindForFocusName("") == Kind::None);                 // a focus id the client table does not name
}

TEST_CASE("The craft kinds are stations, with a work emote each", "[ClassicTownErrand]")
{
    REQUIRE(IsCraftKind(Kind::Forge));
    REQUIRE(IsCraftKind(Kind::Cookfire));
    REQUIRE(IsCraftKind(Kind::Loom));
    REQUIRE(IsCraftKind(Kind::Moonwell));
    REQUIRE_FALSE(IsCraftKind(Kind::Bank));
    REQUIRE_FALSE(IsCraftKind(Kind::Mailbox));
    REQUIRE(WorkEmoteFor(Kind::Forge) == 173);          // EMOTE_STATE_WORK
    REQUIRE(WorkEmoteFor(Kind::Cookfire) == 69);        // EMOTE_STATE_USE_STANDING
    REQUIRE(WorkEmoteFor(Kind::Moonwell) == 68);        // EMOTE_STATE_KNEEL
    REQUIRE(WorkEmoteFor(Kind::Bank) == 0);
    REQUIRE(std::string_view(KindName(Kind::Forge)) == "forge");
    REQUIRE(std::string_view(KindName(Kind::Cookfire)) == "cooking fire");
}

TEST_CASE("The linger and the fixture a kind gets come from its config", "[ClassicTownErrand]")
{
    Config c;   // defaults: 20-40 s at the bank and the auction house, 45-90 s at a station
    std::uint32_t lo = 0, hi = 0;
    LingerRange(c, Kind::Vendor, lo, hi);
    REQUIRE(lo == c.linger_min_ms);
    REQUIRE(hi == c.linger_max_ms);
    LingerRange(c, Kind::Bank, lo, hi);
    REQUIRE(lo == 20000u);
    REQUIRE(hi == 40000u);
    LingerRange(c, Kind::Auction, lo, hi);
    REQUIRE(lo == 20000u);
    REQUIRE(hi == 40000u);
    LingerRange(c, Kind::Forge, lo, hi);
    REQUIRE(lo == 45000u);
    REQUIRE(hi == 90000u);
    LingerRange(c, Kind::Cookfire, lo, hi);
    REQUIRE(lo == 45000u);
    REQUIRE(hi == 90000u);
    REQUIRE(FixtureTarget(c, Kind::Bank) == 3);
    REQUIRE(FixtureTarget(c, Kind::Auction) == 3);
    REQUIRE(FixtureTarget(c, Kind::Forge) == 2);
    REQUIRE(FixtureTarget(c, Kind::Cookfire) == 1);
    REQUIRE(FixtureTarget(c, Kind::Loom) == 0);        // off by default: rarely seen in Classic
    REQUIRE(FixtureTarget(c, Kind::Vendor) == 0);      // no fixture for a plain errand
}

TEST_CASE("An errand that ends clears its craft-station state", "[ClassicTownErrand]")
{
    State st;
    st.focus_type = 7;
    st.next_use_ms = 12345u;
    st.work_emote = true;
    st.tool_bag = 1;
    st.tool_slot = 4;
    st.kit_ready = true;
    st.tool_in_hand = true;
    st.kit_attempts = 3;
    st.next_kit_ms = 999u;
    st.stock_given = true;
    st.recipe_given = true;
    st.want_vendor = true;
    st.Clear();
    REQUIRE(st.focus_type == 0);
    REQUIRE(st.next_use_ms == 0);
    REQUIRE_FALSE(st.work_emote);
    // The tool swap is undone before Clear — the reset value is "no tool" (0xFF), not a bag slot.
    REQUIRE(st.tool_bag == 0xFF);
    REQUIRE(st.tool_slot == 0xFF);
    REQUIRE_FALSE(st.kit_ready);
    REQUIRE_FALSE(st.tool_in_hand);
    REQUIRE(st.kit_attempts == 0);
    REQUIRE(st.next_kit_ms == 0);
    REQUIRE_FALSE(st.stock_given);
    REQUIRE_FALSE(st.recipe_given);
    // want_vendor outlives the errand that set it — it steers the next pick to a vendor.
    REQUIRE(st.want_vendor);
}
