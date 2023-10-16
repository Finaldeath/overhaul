//::///////////////////////////////////////////////
//:: os_cut_grate
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"
#include "inc_remeffect"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
// Generic function. Done to show how to make your own functions.
void GenericFunction(int iCut, object oPC);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetEnteringObject();
    RemovePoly(oPC);

    // Change to whatever cutscene number you want to use.
    int iCut = 20;

    // Usually check to see if PC is firing the scene.
    if(GetIsPC(oPC))
    {
        // Do once
        if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
        {
            // Immediately blacks out screen. Fade in when the scene starts.
            BlackScreen(oPC);
            SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

            // Do any pre-cutscene stuff here.
            //

            // Start the scene.
            DelayCommand(1.0,StartCutscene(oPC, iCut));
        }
    }
}

void StartCutscene(object oPC, int iCut)
{
      // Setup the scene for the PC. Leave this alone.
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);

      // Cutscene objects other than the PC. Define them, then set the cutscene as
      // active on them. This will allow them to be commanded using any cutscene functions
      // in the include.
        object oGrate = GetObjectByTag("q2ab_at_q3ae");
        object oDylan = GetObjectByTag("q2_dylan");
        object oAlias = GetObjectByTag("q2_alias");
        object oBaby = GetNearestObjectByTag("q2ab_common_baby",oPC);
        object oSmart1 = GetNearestObjectByTag("q2_ambbecket_smart",oPC,0);
        object oSmart2 = GetNearestObjectByTag("q2_ambbecket_smart",oPC,1);
        object oComm = GetNearestObjectByTag("NW_COMMALE",oPC);
        object oGuard = GetNearestObjectByTag("q2_localguard",oPC);
        object oMom = GetObjectByTag("q2_mommaji");
        object oRat = GetObjectByTag("q2_ratstore");
        object oRock = GetObjectByTag("q2_rockshop");

        AssignCommand(oDylan,ActionRandomWalk());
        AssignCommand(oAlias,ActionRandomWalk());
        AssignCommand(oBaby,ActionRandomWalk());
        AssignCommand(oSmart1,ActionRandomWalk());
        AssignCommand(oSmart2,ActionRandomWalk());
        AssignCommand(oComm,ActionRandomWalk());
        AssignCommand(oGuard,ActionRandomWalk());
        AssignCommand(oMom,ActionRandomWalk());

        CutSetActiveCutsceneForObject(oGrate, iCut);
        CutSetActiveCutsceneForObject(oDylan, iCut);
        CutSetActiveCutsceneForObject(oAlias, iCut);
        CutSetActiveCutsceneForObject(oBaby, iCut);
        CutSetActiveCutsceneForObject(oSmart1, iCut);
        CutSetActiveCutsceneForObject(oSmart2, iCut);
        CutSetActiveCutsceneForObject(oComm, iCut);
        CutSetActiveCutsceneForObject(oGuard, iCut);
        CutSetActiveCutsceneForObject(oMom, iCut);
        CutSetActiveCutsceneForObject(oRat, iCut);
        CutSetActiveCutsceneForObject(oRock, iCut);


      // PC Copy. Uncomment if needed. Define the loc where you want to create it.
      location lLoc = GetLocation(oGrate);
//      object oPCCopy = CutCreatePCCopy(oPC, lLoc, "OS_PC_COPY");
//      CutSetActiveCutsceneForObject(oPCCopy, iCut);

      // Waypoint for start. Good idea to jump the PC to where you want at the start.
      location lPCStart = GetLocation(GetObjectByTag("D_q3ai_inv_q2ab"));

/////////////////////////////////////////////////////////

      //
      // Setup the cutscene. Times should stay. Read function comments for more details.
      //
      CutSetCutsceneMode(1.1, oPC, TRUE, CUT_CAMERA_HEIGHT_VERY_LOW, TRUE, 2);

      // Starting camera.
      // Adjust the camera how you see fit. Best to do a snap here while screen
      // is black to get your "starting" camera.
      CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 15.0, 75.0,
                   CAMERA_TRANSITION_TYPE_MEDIUM);
      CutJumpToLocation(2.3, oPC, lPCStart);

      // Fade in so we can start the scene.
      CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      // This is where all your action takes place. Do PC movements, spells, dialog,
      // fighting, camera movements, etc, here.

        CutPlayAnimation(8.0,oGrate,ANIMATION_PLACEABLE_OPEN,1.0);

        CutClearAllActions(9.0,oDylan, TRUE);
        CutClearAllActions(9.0,oAlias, TRUE);
        CutClearAllActions(9.0,oBaby, TRUE);
        CutClearAllActions(9.0,oSmart1, TRUE);
        CutClearAllActions(9.0,oSmart2, TRUE);
        CutClearAllActions(9.0,oComm, TRUE);
        CutClearAllActions(9.0,oGuard, TRUE);
        CutClearAllActions(9.0,oMom, TRUE);
        CutClearAllActions(9.0,oRat, TRUE);
        CutClearAllActions(9.0,oRock, TRUE);

        CutActionMoveToObject(10.0,oDylan, oGrate,TRUE);
        CutActionMoveToObject(10.0,oAlias, oGrate,TRUE);
        CutActionMoveToObject(10.0,oBaby, oGrate,TRUE);
        CutActionMoveToObject(10.0,oSmart1, oGrate,TRUE);
        CutActionMoveToObject(10.0,oSmart2, oGrate,TRUE);
        CutActionMoveToObject(10.0,oComm, oGrate,TRUE);
        CutActionMoveToObject(10.0,oGuard, oGrate,TRUE);
        CutActionMoveToObject(10.0,oMom, oGrate,TRUE);


        CutPlayAnimation(14.0,oGrate,ANIMATION_PLACEABLE_CLOSE,1.0);
      // End scene. Change times and parameters accordingly.
      // What should stay: The time difference between Fade and Disable, and the
      // fade length (1.5). These produce the best results.
      CutFadeOutAndIn(14.5, oPC, 1.5);
      CutJumpToLocation(15.0, oPC, lLoc);
        CutActionStartConversation(15.0,oDylan,oPC,"q2_dylan");
      CutDisableCutscene(iCut, 15.0, 15.0, RESTORE_TYPE_NONE);
//      CutDestroyPCCopy(19.5,oPC,FALSE);
}

// Change to be whatever you need.
void GenericFunction(int iCut, object oPC)
{
    // oPC is whatever object you need this function for. Change accordingly.
    if(iCut == GetLocalInt(oPC, "nCutsceneNumber"))
    {
    // Insert function here.
    }
}

