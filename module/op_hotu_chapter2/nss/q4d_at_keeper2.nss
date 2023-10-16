// Activate golems - (mini-cutscene) - and attack player

int CUTSCENE_NUMBER = 43;

#include "x2_inc_cutscene"

void CallPlayAnimation2(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        AssignCommand(oObject, PlayAnimation(nAnimation, 0.3, fLength));
    }
}

void CutPlayAnimation2(float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation2(nCutscene, oObject, nAnimation, fLength)));
}

void main()
{
    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_GOLEM_CUTSCENE_ONCE", 1);

    object oCamera1 = GetObjectByTag("q4d_wp_camera1a");
    object oCamera2 = GetObjectByTag("q4d_wp_camera2a");
    object oPC = GetPCSpeaker();
    object oGolem1 = GetObjectByTag("q4d_mithril1");
    object oGolem2 = GetObjectByTag("q4d_mithril2");
    object oCopySP = GetObjectByTag("q4d_wp_copy_sp");

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oGolem1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGolem2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(OBJECT_SELF, CUTSCENE_NUMBER);
    CutSetCutsceneMode(0.2, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, TRUE, TRUE);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "boom");
    CutFadeOutAndIn(0.0, oPC, 1.5);
    CutSetLocation(0.0, oPC);
    CutDisableAbort(CUTSCENE_NUMBER);
    CutJumpToObject(0.0, OBJECT_SELF, oCopySP);
    CutJumpToObject(1.2, oCopy, oPC);
    CutJumpToObject(0.3, oPC, oCamera1);

    CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(70), oGolem1);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, EffectMovementSpeedDecrease(70), oGolem2);
    CutJumpToObject(0.5, OBJECT_SELF, oCopySP);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 220.0, 3.0, 90.0, CAMERA_TRANSITION_TYPE_SNAP);
    DelayCommand(3.0, SignalEvent(oGolem1, EventUserDefined(101)));
    DelayCommand(3.0, SignalEvent(oGolem2, EventUserDefined(101)));
    CutSetMusic(0.0, oPC, TRACK_BATTLE_CITYBOSS);
    CutPlayAnimation2(1.5, oGolem1, ANIMATION_FIREFORGET_TAUNT, 2.0);
    CutPlaySound(0.0, oPC, "c_golmiron_bat1");
    CutPlaySound(1.5, oPC, "bf_huge");
    CutPlaySound(0.5, oPC, "sim_explsonic");
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oGolem1);
    CutActionMoveToObject(2.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 3.0, 90.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutPlayAnimation2(2.0, oGolem2, ANIMATION_FIREFORGET_TAUNT, 2.0);
    CutPlaySound(0.0, oPC, "c_golmiron_bat1");
    CutPlaySound(1.5, oPC, "bf_huge");
    CutPlaySound(0.5, oPC, "sim_explsonic");
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, VFX_FNF_SCREEN_SHAKE, oGolem2);
    CutAdjustReputation(3.0, oGolem1, oPC, -100);
    CutAdjustReputation(0.0, oPC, oGolem1, -100);
    CutActionAttack(0.5, oGolem1, oPC);
    CutActionAttack(0.0, oGolem2, oPC);
    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);

}
