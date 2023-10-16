//::///////////////////////////////////////////////
//:: Name cutabort23
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Abort of Cutscene 23 - Pit Fight

    Choose a winner at random
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

    //Set the variables that mark the Pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightReady", 2);
    //Set variable that someone has won (1 for red, 2 for blue)
    int nWinner = Random(2) + 1;
    SetLocalInt(GetModule(), "X2_Q2DPitWinner", nWinner);
    //Set the variable for the area that marks the pit fight as finished
    SetLocalInt(GetModule(), "X2_Q2DPitFightOn", 0);

    //Jump the announcer back to his start location
    object oAnnounce = GetObjectByTag("q2d7announcer");
    object oAnnounceStart = GetWaypointByTag("wp_q2d7announce_start");
    AssignCommand(oAnnounce, ActionJumpToObject(oAnnounceStart));

    //Destroy the Gladiators
    object oGlad1 = GetObjectByTag("pitgladblue");
    object oGlad2 = GetObjectByTag("pitgladred");
    DestroyObject(oGlad1);
    DestroyObject(oGlad2);

    AssignCommand(oPC, JumpToLocation(GetLocalLocation(oPC, "X2_Q2DArenaJump")));
    DelayCommand(1.0, FadeFromBlack(oPC, FADE_SPEED_FASTEST));


}
