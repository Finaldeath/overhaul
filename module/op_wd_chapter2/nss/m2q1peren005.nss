//::///////////////////////////////////////////////
//:: Conversation
//:: m2q1Peren005
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Peren attacks.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: January 10, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    DetermineCombatRound();
}
