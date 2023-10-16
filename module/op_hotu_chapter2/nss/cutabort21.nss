//::///////////////////////////////////////////////
//:: Name cutabort21
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Cutscene 21 - Elder Brain orders out
    Thralls to confron the PC.

    Jump Thralls to their start locations and attack
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Sept 17/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{

    object oPC = GetLastPCToCancelCutscene();
    if(GetIsPossessedFamiliar(oPC))
        oPC = GetMaster(oPC);
    SetLocalInt(oPC, "X2_Q2DTPFromCity", 1);
    BlackScreen(oPC);
    object oJumpTo = GetObjectByTag("q2d4_citytp");
    AssignCommand(oPC, JumpToObject(oJumpTo));
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));

    object oDoor = GetObjectByTag("q2d4_overmind_door");
    object oGuard1 = GetObjectByTag("cut101_guard1");
    object oGuard2 = GetObjectByTag("cut101_guard2");
    object oGuard3 = GetObjectByTag("cut101_guard3");

    //Locations near the teleporter
    object oGuard1Jump = GetWaypointByTag("wp_cut101end_thrall1");
    object oGuard2Jump = GetWaypointByTag("wp_cut101end_thrall2");
    object oGuard3Jump = GetWaypointByTag("wp_cut101end_thrall3");

    //Make sure the door to the mindflayer inner enclave is closed
    AssignCommand(oDoor, ActionCloseDoor(oDoor));

    AssignCommand(oGuard1, JumpToObject(oGuard1Jump));
    AssignCommand(oGuard2, JumpToObject(oGuard2Jump));
    AssignCommand(oGuard3, JumpToObject(oGuard3Jump));

    DelayCommand(1.0, ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE));
    DelayCommand(1.0, ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE));
    DelayCommand(1.0, ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE));
    DelayCommand(1.5, AssignCommand(oGuard1, DetermineCombatRound()));
    DelayCommand(1.5, AssignCommand(oGuard2, DetermineCombatRound()));
    DelayCommand(1.5, AssignCommand(oGuard3, DetermineCombatRound()));
}
