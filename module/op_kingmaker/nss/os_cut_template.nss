//::///////////////////////////////////////////////
//:: os_cut_template
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
#include "x2_inc_cutscene"

// Standard cutscene start. Best to wrap in a function in the event
// you need to do things before scene starts.
void StartCutscene(object oPC, int iCut);
// Generic function. Done to show how to make your own functions.
void GenericFunction(int iCut, object oPC);

void main()
{
    // Change to however you get the cutscene activator.
    object oPC = GetEnteringObject();
    // Change to whatever cutscene number you want to use.
    int iCut = 0;

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
            StartCutscene(oPC, iCut);
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
      object oObject1 = GetObjectByTag("/*insert here*/");
      CutSetActiveCutsceneForObject(oObject1, iCut);
      object oObject2 = GetObjectByTag("/*insert here*/");
      CutSetActiveCutsceneForObject(oObject2, iCut);

      // PC Copy. Uncomment if needed. Define the loc where you want to create it.
      //object oPCCopy = CutCreatePCCopy(oPC, lLoc, "HX_PC_COPY");
      //CutSetActiveCutsceneForObject(oPCCopy, iCut);

      // Waypoint foir start. Good idea to jump the PC to where you want at the start.
      location lPCStart = GetLocation(GetObjectByTag("/*insert here*/"));

/////////////////////////////////////////////////////////

      //
      // Setup the cutscene. Times should stay. Read function comments for more details.
      //
      CutSetCutsceneMode(1.1, oPC, TRUE, FALSE, TRUE, 2);

      // Starting camera.
      // Adjust the camera how you see fit. Best to do a snap here while screen
      // is black to get your "starting" camera.
      CutSetCamera(2.2, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 5.0, 75.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(2.3, oPC, lPCStart);

      // Fade in so we can start the scene.
      CutFadeFromBlack(2.5, oPC, FADE_SPEED_MEDIUM);

      // Start the scene.
      // This is where all your action takes place. Do PC movements, spells, dialog,
      // fighting, camera movements, etc, here.


      // End scene. Change times and parameters accordingly.
      // What should stay: The time difference between Fade and Disable, and the
      // fade length (1.5). These produce the best results.
      CutFadeOutAndIn(40.5, oPC, 1.5);
      CutDisableCutscene(iCut, 41.0, 41.0, RESTORE_TYPE_NONE);
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

