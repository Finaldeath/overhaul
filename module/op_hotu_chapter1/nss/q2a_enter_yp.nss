//::///////////////////////////////////////////////
//:: Name: q2a_enter_yp
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Check to see if cutscene 5 is running when a PC
    enters the area - if it is - jump them so they
    can view the cutscene -
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 21/03
//:://////////////////////////////////////////////

#include "x2_inc_cutscene"
void main()
{

    object oPC = GetEnteringObject();
    //If the entering object is a PC
    if (GetIsPC(oPC) == TRUE)
    {
        //The first time - set the music track
        if (GetLocalInt(OBJECT_SELF, "nMusicOn") != 1)
        {
            MusicBackgroundChangeDay(OBJECT_SELF, TRACK_TAVERN3);
            MusicBackgroundChangeNight(OBJECT_SELF, TRACK_TAVERN3);
            MusicBackgroundPlay(OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "nMusicOn", 1);
        }
        //Check to see if cutscene 5 is in progress - if it is - we need
        //to grab any pc that enters after it has started and jump them to
        //the main room -- in cutscene mode
        //The only way this variable gets set to one is in the script "q2a_ent_durncut"
        //which can only be triggered by PC# 1 (the Hero PC) - so this entering PC must
        //be a different PC and thus can be treated as a non-Hero PC
        if (GetLocalInt(GetModule(), "X2_CutScene5") == 1)
        {
            CutSetCutsceneMode(0.0, oPC, TRUE, FALSE, TRUE, TRUE); // keep and freeze associates
            CutSetActiveCutsceneForObject(oPC, 5);
            CutSetActiveCutscene(5, CUT_DELAY_TYPE_CONSTANT);
            CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SNAP);
            AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_cut5_pcx")));
        }
        //else see if Cutscene 5a - the Well Room cutscene - is running, and
        // you enter here - then freeze them at the second pc waypoints in the main room
        else if (GetLocalInt(GetModule(), "X2_CutScene5a") == 1 && GetLocalInt(oPC, "X2_Cut5aJump") != 1)
        {
            //GetPCNumber and jump the PC upstairs
            int nPCNumber = GetLocalInt(oPC, "nPCNumber");
            //Turn cutscene mode on
            SetCutsceneMode(oPC, TRUE);
            //Set the PCs cutscene variable
            SetLocalInt(oPC, "nCutsceneNumber", 5);
            //First five PCs have their own waypoint...
            if (nPCNumber < 6)
            {
                //CutJumpToObject(nCutsceneNumber, 1.75, oPC, GetWaypointByTag("wp_cut5b_pc" + IntToString(nPCNumber)));
                AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_cut5b_pc" + IntToString(nPCNumber))));
            }
            else
            {
                AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("wp_cut5b_pcx")));
            }
            CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 190.0, 15.0, 50.0,
                 CAMERA_TRANSITION_TYPE_SLOW);
        }

    //check how many times the PC has entered this area - on any after the first (the first time the PC should be jumped into conversation with Durnan)
    //if the cutscene has not run yet - have durnan start talking to the PC
    //This is to catch any save/load issues that might exist before
        if (GetLocalInt(oPC, "X2_nTimesEnteredYP") > 0)
        {
            if (GetLocalInt(GetModule(), "nYPAttackDone") == 0)
            {
                object oDurnan = GetObjectByTag("q2adurnan");
                AssignCommand(oDurnan, ActionStartConversation(oPC));
            }
        }
        SetLocalInt(oPC, "X2_nTimesEnteredYP", 1);


    }
    //else for NPCs - check for guards..and destroy them
    else
    {
        if (GetTag(oPC) == "q2a1_warningguard" || GetTag(oPC) == "q2a1_preguard")
            DestroyObject(oPC);
    }

}
