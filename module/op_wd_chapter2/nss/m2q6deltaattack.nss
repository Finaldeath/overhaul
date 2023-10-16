//::///////////////////////////////////////////////
//:: Conversation
//:: m2q6DeltaAttack
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Deltagar and his group attack.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 15, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    AdjustReputation(GetPCSpeaker(),OBJECT_SELF,-100);
    DetermineCombatRound();
}
