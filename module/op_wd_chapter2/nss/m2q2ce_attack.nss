//::///////////////////////////////////////////////
//:: M2Q2CE_ATTACK
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This makes the golem attack the player right away.
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: January 25, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    SetIsTemporaryEnemy(oPC);
    DetermineCombatRound();
}
