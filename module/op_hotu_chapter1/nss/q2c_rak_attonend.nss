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


void main()
{
    object oPC = GetPCSpeaker();
    object oRak1 = GetObjectByTag("q2ckalikin");
    object oRak2 = GetObjectByTag("q2czephyre");

    SetIsTemporaryEnemy(oPC, oRak1);
    SetIsTemporaryEnemy(oPC, oRak2);
    SetIsTemporaryEnemy(oPC, OBJECT_SELF);

    DetermineCombatRound();
    AssignCommand(oRak1, DetermineCombatRound(oPC));
    AssignCommand(oRak2, DetermineCombatRound(oPC));

}
