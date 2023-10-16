//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q5ZAMITH2006
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Zamithra attacks.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 14, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC),OBJECT_SELF,-100);
    DetermineCombatRound();
}
