//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: q3_attack_jnah
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    if gnolls are friendly - they should appear
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
    SetIsTemporaryEnemy(GetPCSpeaker());
    DetermineCombatRound();
}

