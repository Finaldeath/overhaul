// Activate golems - (mini-cutscene) - they move to the pedestals and the door is opened

int CUTSCENE_NUMBER = 42;

#include "x2_inc_cutscene"
#include "nw_i0_plot"

void main()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE", 1);

    object oPC = GetPCSpeaker();

    Reward_2daXP(oPC, 35);
    object oGolem1 = GetObjectByTag("q4d_mithril1");
    object oGolem2 = GetObjectByTag("q4d_mithril2");
    object oWP1 = GetObjectByTag("q4d_wp_golem1");
    object oWP2 = GetObjectByTag("q4d_wp_golem2");
    object oWP1a = GetObjectByTag("q4d_wp_golem1a");
    object oWP2a = GetObjectByTag("q4d_wp_golem2a");
    object oCamera1 = GetObjectByTag("q4d_wp_camera1");
    object oCamera2 = GetObjectByTag("q4d_wp_camera2");
    object oCopySP = GetObjectByTag("q4d_wp_copy_sp");
    object oDoor = GetObjectByTag("q4d_door2");
    effect eMove = EffectMovementSpeedDecrease(70);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oGolem1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGolem2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oDoor, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(OBJECT_SELF, CUTSCENE_NUMBER);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "cut42_pccopy");
    CutSetLocation(0.0, oPC);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eMove, oGolem1, 20.0);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, eMove, oGolem2, 20.0);
    CutDisableAbort(CUTSCENE_NUMBER);
    CutJumpToObject(0.0, OBJECT_SELF, oCopySP);
    CutFadeOutAndIn(0.0, oPC, 2.0);
    CutSetCutsceneMode(1.0, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    CutJumpToObject(0.0, oCopy, oPC);
    CutJumpToObject(0.5, oPC, oCamera1);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    DelayCommand(1.0, SignalEvent(oGolem1, EventUserDefined(101)));
    //DelayCommand(1.0, SignalEvent(oGolem2, EventUserDefined(101)));
    CutActionMoveToObject(1.5, oGolem1, oWP1a, FALSE);
    CutActionMoveToObject(0.0, oGolem2, oWP2a, FALSE);
    CutActionMoveToObject(2.0, oGolem1, oWP1, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 12.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_SLOW);
    CutActionMoveToObject(0.0, oGolem2, oWP2, FALSE);
    //CutSetCameraSpeed(0.0, oPC, 0.8);
    CutActionMoveToLocation(0.5, oPC, GetLocation(oCamera2), FALSE);
    CutActionOpenDoor(7.0, oDoor, oDoor);
    CutDisableCutscene(CUTSCENE_NUMBER, 2.0, 2.0);

}


