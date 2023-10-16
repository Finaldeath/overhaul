//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q1DarkT002
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Darktongue goes hostile.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oGuard1 = GetNearestObjectByTag("M2Q1CDARKTGUARD",OBJECT_SELF,1);
    object oGuard2 = GetNearestObjectByTag("M2Q1CDARKTGUARD",OBJECT_SELF,2);

    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
    AssignCommand(oGuard1,DetermineCombatRound());
    AssignCommand(oGuard2,DetermineCombatRound());
    DetermineCombatRound();
}
