//::///////////////////////////////////////////////
//:: Name q2a1_enter_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If this is the first time the PC is entering the temple,
    then this is the start of the chapter - so run the
    initial entry cutscene
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  August 27/03
//:://////////////////////////////////////////////
#include "x2_inc_globals"
void main()
{

    object oPC = GetEnteringObject();

    if (GetIsDM(oPC) == TRUE)
        return;

    if (GetIsPC(oPC) == FALSE)
        return;

    //Check for 4 plots having been completed - in which case the PC has jumped in here
    //so start a conversation with the seer
    if (GetLocalInt(GetModule(), "X2_Chapter2Plots_Done") == 6)
    {
        //Set Variable for the Seer's conversation
        SetLocalInt(GetModule(), "X2_StartSeerSiegeSpeech", 1);
        object oSeer = GetObjectByTag("q2aseer");
        AssignCommand(oSeer, ActionStartConversation(oPC));
    }

    //Its ok to return at this point as all the actions below this
    //point should be done right at the start of the chapter - the slave girl won't get freed until later
    if (GetLocalInt(OBJECT_SELF, "nSlaveGirlCreated") == 1)
        return;

    //Spawn in the slave girl if she was freed from the Overmind
    if (GetGlobalInt("X2_Q2DFreedSlaveGirl") == 1)
    {
        SetLocalInt(OBJECT_SELF, "nSlaveGirlCreated", 1);
        location lSpawn = GetLocation(GetWaypointByTag("wp_q2dfreeslavegirl_spn"));
        CreateObject(OBJECT_TYPE_CREATURE, "q2_freedslave", lSpawn);
    }

    //START OF CHAPTER 2 ACTIONS
    if (GetLocalInt(OBJECT_SELF, "nCutscene102Done") == 1)
        return;
    // * reload chapter 1 data
    ExecuteScript("x2_c2_start", oPC);

    //Execute the Chapter 2 Start cutscene
    SetLocalInt(OBJECT_SELF, "nCutscene102Done", 1);
    ExecuteScript("cutscene_102", oPC);
}
