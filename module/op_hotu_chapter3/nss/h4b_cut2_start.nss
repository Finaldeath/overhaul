//::///////////////////////////////////////////////
//:: Name h4b_cut2_start
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This is start of the second cutscene for the
     area, showing the mimic running away.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 15, 2003
//:://////////////////////////////////////////////
#include "hx_inc_ring"
#include "x2_inc_cutscene"
void StartCutscene(object oPC, int iCut);

void main()
{
    object oPC = GetEnteringObject();
    int iCut = 60;

    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1 && GetIsPC(oPC))
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);

        StartCutscene(oPC, iCut);
    }
}

void StartCutscene(object oPC, int iCut)
{
      // Setup the scene
      CutSetActiveCutscene(iCut, CUT_DELAY_TYPE_CONSTANT);
      CutSetActiveCutsceneForObject(oPC, iCut, TRUE);
      CutDisableAbort(iCut);


      // Cutscene objects other than the PC.
      object oMimic = GetObjectByTag("hx_mimic");
      CutSetActiveCutsceneForObject(oMimic, iCut);
      object oPCStartWP = GetObjectByTag("h4b_cut2_start_wp");
      CutSetActiveCutsceneForObject(oPCStartWP, iCut);
      object oMimicEndWP = GetObjectByTag("h4b_cut2_end_mimic_wp");
      CutSetActiveCutsceneForObject(oMimicEndWP, iCut);
      object oMimicEndWP2 = GetObjectByTag("h4b_cut2_end_mimic_wp2");
      CutSetActiveCutsceneForObject(oMimicEndWP2, iCut);
      object oPCEndWP = GetObjectByTag("h4b_cut2_end_pc_wp");
      CutSetActiveCutsceneForObject(oMimicEndWP, iCut);

      // Setup the cutscene. Destroy the trigger now. Adjust the camera.
      CutBlackScreen(0.0, oPC);
      CutSetCutsceneMode(0.1, oPC, TRUE, FALSE);
      CutSetCamera(0.3, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 7.0, 60.0,
                   CAMERA_TRANSITION_TYPE_SNAP);
      CutJumpToLocation(1.0, oPC, GetLocation(oPCStartWP));
      CutFadeFromBlack(1.5, oPC, FADE_SPEED_SLOW);


      // Start the scene.
      CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 80.0, 4.0, 72.0,
                   CAMERA_TRANSITION_TYPE_VERY_SLOW);
      CutPlayAnimation(3.0, oMimic, ANIMATION_LOOPING_SPASM, 0.0);
      CutActionMoveToObject(5.0, oMimic, oMimicEndWP, TRUE);
      CutSetFacingPoint(6.0, oPC, "h4b_cut2_end_mimic_wp");
      CutPlayVoiceChat(6.5, oPC, VOICE_CHAT_TAUNT);
      CutPlayAnimation(6.6, oPC, ANIMATION_FIREFORGET_TAUNT, 1.0);
      CutJumpToLocation(7.0, oMimic, GetLocation(oMimicEndWP2));
      CutActionMoveToObject(8.0, oPC, oMimicEndWP, TRUE);
      CutJumpToLocation(11.0, oPC, GetLocation(oPCEndWP));
      // End scene.
      CutFadeToBlack(9.5, oPC, FADE_SPEED_MEDIUM);
      //CutDisableCutscene(iCut, 11.5, 11.5, RESTORE_TYPE_NONE);
}
