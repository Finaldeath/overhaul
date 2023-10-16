//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: NW_D1_AttOnEnd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "NW_I0_HOSTINCL"
void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, OBJECT_SELF, 1, CREATURE_TYPE_PERCEPTION, PERCEPTION_SEEN);
    if(GetIsObjectValid(oPC))
    {
        AdjustReputation(oPC, OBJECT_SELF, -100);
        DelayCommand(2.0, DetermineCombatRound(oPC));
        SetSpawnInCondition(NW_FLAG_HEARTBEAT_EVENT, FALSE);
    }
}


