// Camera focus on valsharess and male guard for cutscene 703 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT703_PC");
    object oGuard = GetObjectByTag("q7_male");
    CutSetActiveCutscene(703, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetActiveCutsceneForObject(oGuard, 703);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 280.0, 2.0, 90.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetMusic(0.0, oPC, 62);
    CutSetFacingPoint(0.0, OBJECT_SELF, GetTag(oGuard));
    CutSetFacingPoint(1.0, oGuard, GetTag(OBJECT_SELF));
    CutPlayAnimation(2.0, oGuard, ANIMATION_FIREFORGET_SALUTE, 1.0);
    //CutPlayVoiceChat(3.0, oGuard, VOICE_CHAT_YES);
    CutSetCameraSpeed(0.0, oPC, 0.1);
    CutActionMoveToLocation(4.0, oPC, GetLocation(OBJECT_SELF), FALSE);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 70.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutSetCamera(8.0, oPC, CAMERA_MODE_TOP_DOWN, 80.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);

}
