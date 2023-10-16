//:://////////////////////////////////////////////////
//:: CUSTOM OnSpawn handler.

#include "x0_i0_anims"
//#include "x0_i0_walkway"
#include "x0_i0_treasure"

void main()
{
    // SetSpawnInCondition(NW_FLAG_SPECIAL_CONVERSATION);
    // SetSpawnInCondition(NW_FLAG_SPECIAL_COMBAT_CONVERSATION);
    // SetSpawnInCondition(NW_FLAG_SHOUT_ATTACK_MY_TARGET);
    // SetSpawnInCondition(NW_FLAG_STEALTH);
    // SetSpawnInCondition(NW_FLAG_SEARCH);
    // SetSpawnInCondition(NW_FLAG_SET_WARNINGS);
    // SetSpawnInCondition(NW_FLAG_DAY_NIGHT_POSTING);
    // SetSpawnInCondition(NW_FLAG_APPEAR_SPAWN_IN_ANIMATION);
    // SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    // SetSpawnInCondition(NW_FLAG_AMBIENT_ANIMATIONS);

    // SetAnimationCondition(NW_ANIM_FLAG_IS_CIVILIZED);
    // SetAnimationCondition(NW_ANIM_FLAG_CONSTANT);
    // SetAnimationCondition(NW_ANIM_FLAG_CHATTER);
    // SetAnimationCondition(NW_ANIM_FLAG_IS_MOBILE_CLOSE_RANGE);

    // SetCombatCondition(X0_COMBAT_FLAG_RANGED);
    // SetCombatCondition(X0_COMBAT_FLAG_DEFENSIVE);
    // SetCombatCondition(X0_COMBAT_FLAG_AMBUSHER);
    // SetCombatCondition(X0_COMBAT_FLAG_COWARDLY);

    // SetSpawnInCondition(NW_FLAG_ESCAPE_RETURN);
    // SetSpawnInCondition(NW_FLAG_ESCAPE_LEAVE);
    // SetSpawnInCondition(NW_FLAG_TELEPORT_LEAVE);
    // SetSpawnInCondition(NW_FLAG_TELEPORT_RETURN);

    SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT);
    SetSpawnInCondition(NW_FLAG_PERCIEVE_EVENT);
    SetSpawnInCondition(NW_FLAG_ATTACK_EVENT);
    SetSpawnInCondition(NW_FLAG_DAMAGED_EVENT);
    SetSpawnInCondition(NW_FLAG_DISTURBED_EVENT);
    SetSpawnInCondition(NW_FLAG_END_COMBAT_ROUND_EVENT);
    SetSpawnInCondition(NW_FLAG_ON_DIALOGUE_EVENT);
    SetSpawnInCondition(NW_FLAG_DEATH_EVENT);

    SetListeningPatterns();
    WalkWayPoints();
    CTG_GenerateNPCTreasure(TREASURE_TYPE_MONSTER, OBJECT_SELF);
    SetLocalString(OBJECT_SELF, "X2_SPECIAL_COMBAT_AI_SCRIPT", "q7ai_valsharess");

    // ***** ADD ANY CUSTOM ON-SPAWN CODE HERE ***** //

}


