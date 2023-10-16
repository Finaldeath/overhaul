//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//:: NW_D1_AttOnEnd02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script makes an NPC attack the person
    they are currently talking with.  This will
    only make the single character hostile not
    their entire faction.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Nov 7, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
void main()
{
    object oGuard1 = GetObjectByTag("q5_arzigguard_1");
    object oGuard2 = GetObjectByTag("q5_arzigguard_2");
    object oPC = GetPCSpeaker();

    SetIsTemporaryEnemy(oPC);
    SetIsTemporaryEnemy(oPC, oGuard1);
    SetIsTemporaryEnemy(oPC, oGuard2);

    DetermineCombatRound();
    AssignCommand(oGuard1, DetermineCombatRound(oPC));
    AssignCommand(oGuard2, DetermineCombatRound(oPC));
    SetLocalInt(GetModule(),"X1_Q5CHAMPION",0);
}

