//::///////////////////////////////////////////////
//:: Attack on End of Conversation
//::  act_q5arzig_6
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    They all attack PC, Klumph runs off, reappear in cell.
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
    object oMaster = GetObjectByTag("Q5_KLUMPH");
    object oCell = GetWaypointByTag("wp_q5masterjump_cell");

    AssignCommand(oMaster, ActionForceMoveToObject(oCell, TRUE, 1.0, 6.0));

    SetIsTemporaryEnemy(oPC);
    SetIsTemporaryEnemy(oPC, oGuard1);
    SetIsTemporaryEnemy(oPC, oGuard2);

    DetermineCombatRound();
    AssignCommand(oGuard1, DetermineCombatRound(oPC));
    AssignCommand(oGuard2, DetermineCombatRound(oPC));
    SetLocalInt(GetModule(),"X1_Q5CHAMPION",0);
}

