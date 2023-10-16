//::///////////////////////////////////////////////
//:: Attack on End of Conversation and reset hostile LOCAL

#include "NW_I0_GENERIC"


void main()
{
    SetLocalInt(GetModule(),"NW_M4Q1_AribethHostile",0);
    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC), OBJECT_SELF, -100);
//    SetIsTemporaryEnemy();
    DetermineCombatRound();
}

