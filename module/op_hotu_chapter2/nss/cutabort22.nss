//::///////////////////////////////////////////////
//:: Name cutabort22
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Cutscene 22 - Elder Illithid moves out
    himself to confron the PC.

    Jump Mindflayers to their start locations and attack
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
    BlackScreen(oPC);
    location lJumpTo = GetLocalLocation(oPC, "lQ2DCut22Start");
    AssignCommand(oPC, ActionJumpToLocation(lJumpTo));
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));


    object oDoor = GetObjectByTag("q2d4_overmind_door");
    object oMaster = GetObjectByTag("q2d_master");
    object oGuard1 = GetObjectByTag("q2d_poolguard_1");
    object oGuard2 = GetObjectByTag("q2d_poolguard_2");
    object oGuard3 = GetObjectByTag("q2d_poolguard_3");
    object oGuard4 = GetObjectByTag("q2d_poolguard_4");

    //Locations outside the inner sanctum
    object oMasterEnd = GetWaypointByTag("wp_cut102_masterend");

    object oGuard1End = GetWaypointByTag("wp_cut102_guard1end");
    object oGuard2End = GetWaypointByTag("wp_cut102_guard2end");
    object oGuard3End = GetWaypointByTag("wp_cut102_guard3end");
    object oGuard4End = GetWaypointByTag("wp_cut102_guard4end");

    //Make sure the door to the mindflayer inner enclave is closed
    AssignCommand(oDoor, ActionCloseDoor(oDoor));
    SetLocked(oDoor, TRUE);
    AssignCommand(oMaster, JumpToObject(oMasterEnd));
    AssignCommand(oGuard1, JumpToObject(oGuard1End));
    AssignCommand(oGuard2, JumpToObject(oGuard2End));
    AssignCommand(oGuard3, JumpToObject(oGuard3End));
    AssignCommand(oGuard4, JumpToObject(oGuard4End));

    ChangeToStandardFaction(oMaster, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard1, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard2, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard3, STANDARD_FACTION_HOSTILE);
    ChangeToStandardFaction(oGuard4, STANDARD_FACTION_HOSTILE);
    DelayCommand(1.5, AssignCommand(oGuard1, DetermineCombatRound()));
    DelayCommand(1.5, AssignCommand(oGuard2, DetermineCombatRound()));
    DelayCommand(1.5, AssignCommand(oGuard3, DetermineCombatRound()));
}
