//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6MaugAttack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Maugrim and his group attack.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 16, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    DetermineCombatRound();
}
