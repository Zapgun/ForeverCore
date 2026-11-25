// The Playerbot.World.Town.* keys (TownErrand.h, the town shows in AmbientRules.cpp, the town walk in ChunkedWalkToward and the
// capital idle watch). Read once, at the first use.
#pragma once

#include "Config.h"
#include "Bot/TownErrand.h"

#include <algorithm>
#include <cstdint>

namespace Playerbot::V2::TownErrand
{

struct Config
{
    bool          errands = true;          // Errands: capital residents run from place to place
    float         radius = 300.0f;         // ErrandRadius: how far across the city the next place may be
    std::uint32_t linger_min_ms = 4000;    // LingerMinSec / LingerMaxSec: the stop at a place
    std::uint32_t linger_max_ms = 12000;
    std::uint32_t linger_bank_min_ms = 20000;   // LingerBankMinSec / LingerBankMaxSec: the bank visit
    std::uint32_t linger_bank_max_ms = 40000;
    std::uint32_t linger_ah_min_ms = 20000;     // LingerAhMinSec / LingerAhMaxSec: the auction-house visit
    std::uint32_t linger_ah_max_ms = 40000;
    std::uint32_t linger_craft_min_ms = 45000;  // LingerCraftMinSec / LingerCraftMaxSec: working at a station
    std::uint32_t linger_craft_max_ms = 90000;
    std::uint32_t fixture_bank = 3;        // Fixture.*: bots guaranteed at each place (0 = no fixture for the kind)
    std::uint32_t fixture_ah = 3;
    std::uint32_t fixture_forge = 2;
    std::uint32_t fixture_cookfire = 1;
    std::uint32_t fixture_loom = 0;
    std::uint32_t fixture_moonwell = 0;
    bool          craft_cast = true;       // CraftCast: really craft a known recipe at a station (0 = work-emote show only)
    std::uint32_t craft_sound_forge = 4614;    // CraftSound.*: the sound kit pushed to earshot each work
    std::uint32_t craft_sound_cookfire = 7035; // beat (the real Tradeskills kits; 0 = silent like vanilla
    std::uint32_t craft_sound_loom = 6425;     // emote work). 1166 smelt is under Forge; enchanting has
    std::uint32_t craft_sound_moonwell = 0;    // no dedicated kit.
    std::uint32_t spot_cap = 5;            // SpotCap: bots at one place (a bank, an auction house, a trainer) at once
    std::uint32_t inn_cap = 4;             // InnCap: bots resting at one inn at once
    std::uint32_t mailbox_cap = 2;         // MailboxCap: bots at one mailbox at once
    std::uint32_t inn_share_pct = 50;      // InnSharePct: the inn's share of the bots (TownLife::InnPercent) scaled by this
    bool          exits = true;            // Exits: the city gate is one of the places, when the gate-duel driver has found it
    bool          smooth_walk = true;      // SmoothWalk: in a capital a walk of up to SmoothWalkYards is one pathed move, not 35 y chunks
    float         smooth_walk_yards = 200.0f;   // a navmesh route of up to 60 points (about 240 y) goes out as one spline
    float         nudge_yards = 5.0f;      // PlayerNudgeYards / PlayerNudgeSec: a standing bot a real player stands next to moves on
    std::uint32_t nudge_ms = 6000;
    std::uint32_t idle_ms = 20000;         // IdleSec: a bot in a capital standing this long with no reason is given something to do
    std::uint32_t field_idle_ms = 30000;   // Playerbot.World.IdleSec: the same anywhere else (the idle watch, Bot/IdleWatch.h)
};

// The linger range a place of `kind` gets (the dedicated stays; the generic pair covers everything else).
inline void LingerRange(Config const& c, Kind k, std::uint32_t& min_ms, std::uint32_t& max_ms)
{
    switch (k)
    {
        case Kind::Bank:    min_ms = c.linger_bank_min_ms;  max_ms = c.linger_bank_max_ms;  return;
        case Kind::Auction: min_ms = c.linger_ah_min_ms;    max_ms = c.linger_ah_max_ms;    return;
        case Kind::Forge: case Kind::Cookfire: case Kind::Loom: case Kind::Moonwell:
            min_ms = c.linger_craft_min_ms; max_ms = c.linger_craft_max_ms; return;
        default:            min_ms = c.linger_min_ms;       max_ms = c.linger_max_ms;       return;
    }
}

// How many bots a place of `kind` keeps occupied through the fixture steering (0 = no fixture).
inline std::uint32_t FixtureTarget(Config const& c, Kind k)
{
    switch (k)
    {
        case Kind::Bank:     return c.fixture_bank;
        case Kind::Auction:  return c.fixture_ah;
        case Kind::Forge:    return c.fixture_forge;
        case Kind::Cookfire: return c.fixture_cookfire;
        case Kind::Loom:     return c.fixture_loom;
        case Kind::Moonwell: return c.fixture_moonwell;
        default:             return 0;
    }
}

// The SoundKit pushed to earshot on each work beat at a place of a kind (0 = silent).
inline std::uint32_t SoundKitFor(Config const& c, Kind k)
{
    switch (k)
    {
        case Kind::Forge:    return c.craft_sound_forge;
        case Kind::Cookfire: return c.craft_sound_cookfire;
        case Kind::Loom:     return c.craft_sound_loom;
        case Kind::Moonwell: return c.craft_sound_moonwell;
        default:             return 0;
    }
}

inline Config const& Cfg()
{
    static Config const c = []
    {
        Config k;
        k.errands           = sConfigMgr->GetBoolDefault("Playerbot.World.Town.Errands", true, true);
        k.radius            = float(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.ErrandRadius", 300, true), 60, 1000));
        k.linger_min_ms     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerMinSec", 4, true), 0, 300)) * 1000u;
        k.linger_max_ms     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerMaxSec", 12, true), 0, 600)) * 1000u;
        k.linger_max_ms     = std::max(k.linger_max_ms, k.linger_min_ms);
        k.linger_bank_min_ms   = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerBankMinSec", 20, true), 0, 300)) * 1000u;
        k.linger_bank_max_ms   = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerBankMaxSec", 40, true), 0, 600)) * 1000u;
        k.linger_bank_max_ms   = std::max(k.linger_bank_max_ms, k.linger_bank_min_ms);
        k.linger_ah_min_ms     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerAhMinSec", 20, true), 0, 300)) * 1000u;
        k.linger_ah_max_ms     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerAhMaxSec", 40, true), 0, 600)) * 1000u;
        k.linger_ah_max_ms     = std::max(k.linger_ah_max_ms, k.linger_ah_min_ms);
        k.linger_craft_min_ms  = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerCraftMinSec", 45, true), 0, 300)) * 1000u;
        k.linger_craft_max_ms  = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.LingerCraftMaxSec", 90, true), 0, 600)) * 1000u;
        k.linger_craft_max_ms  = std::max(k.linger_craft_max_ms, k.linger_craft_min_ms);
        k.fixture_bank      = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Bank", 3, true), 0, 50));
        k.fixture_ah        = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Ah", 3, true), 0, 50));
        k.fixture_forge     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Forge", 2, true), 0, 50));
        k.fixture_cookfire  = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Cookfire", 1, true), 0, 50));
        k.fixture_loom      = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Loom", 0, true), 0, 50));
        k.fixture_moonwell  = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.Fixture.Moonwell", 0, true), 0, 50));
        k.craft_cast        = sConfigMgr->GetBoolDefault("Playerbot.World.Town.CraftCast", true, true);
        k.craft_sound_forge    = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.CraftSound.Forge", 4614, true), 0, 100000));
        k.craft_sound_cookfire = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.CraftSound.Cookfire", 7035, true), 0, 100000));
        k.craft_sound_loom     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.CraftSound.Loom", 6425, true), 0, 100000));
        k.craft_sound_moonwell = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.CraftSound.Moonwell", 0, true), 0, 100000));
        k.spot_cap          = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.SpotCap", 5, true), 1, 100));
        k.inn_cap           = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.InnCap", 4, true), 0, 100));
        k.mailbox_cap       = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.MailboxCap", 2, true), 0, 100));
        k.inn_share_pct     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.InnSharePct", 50, true), 0, 100));
        k.exits             = sConfigMgr->GetBoolDefault("Playerbot.World.Town.Exits", true, true);
        k.smooth_walk       = sConfigMgr->GetBoolDefault("Playerbot.World.Town.SmoothWalk", true, true);
        k.smooth_walk_yards = float(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.SmoothWalkYards", 200, true), 60, 240));
        k.nudge_yards       = float(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.PlayerNudgeYards", 5, true), 0, 30));
        k.nudge_ms          = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.PlayerNudgeSec", 6, true), 1, 600)) * 1000u;
        k.idle_ms           = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.Town.IdleSec", 20, true), 5, 600)) * 1000u;
        k.field_idle_ms     = std::uint32_t(std::clamp<int>(sConfigMgr->GetIntDefault("Playerbot.World.IdleSec", 30, true), 5, 600)) * 1000u;
        return k;
    }();
    return c;
}

} // namespace Playerbot::V2::TownErrand
