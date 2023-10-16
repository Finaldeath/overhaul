// End of matron dialog dialog (returning to throne room):
// - devil kills all the guards
// - matron gets angry and attacks.
// - fight! fight! fight!

#include "x2_inc_cutscene"
int CUTSCENE_NUMBER = 701;

void CallSignalEvent(int nCutscene, object oObject, int nEvent)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
         SignalEvent(oObject, EventUserDefined(101));
    }
}

void CutSignalEvent(float fDelay, object oObject, int nEvent, int iShift = TRUE)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallSignalEvent(nCutscene, oObject, nEvent)));
}


void main()
{
    object oPC = GetPCSpeaker();
    object oGuard1 = GetObjectByTag("q7_guard1");
    object oGuard2 = GetObjectByTag("q7_guard2");
    object oGuard3 = GetObjectByTag("q7_guard3");
    object oGuard4 = GetObjectByTag("q7_guard4");
    object oGuard5 = GetObjectByTag("q7_guard5");
    object oGuard6 = GetObjectByTag("q7_guard6");
    object oGuard7 = GetObjectByTag("q7_guard7");
    object oMeph = GetObjectByTag("q7_meph");
    object oCamera3a = GetWaypointByTag("q7b_wp_camera3");
    effect eKill = EffectDeath();
    effect eFire = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
    //effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
    effect eVis2 = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    //eKill = EffectLinkEffects(eKill, eVis);
    if(GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES)
        eKill = EffectLinkEffects(eKill, eVis2);
    object oMatron = GetObjectByTag("q7_matron");
    object oCopy = GetObjectByTag("q7b2_pc_copy");
    object oPCWalk = GetWaypointByTag("q7b2_wp_pc_walk");

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetActiveCutsceneForObject(oGuard1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard3, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard4, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard5, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard6, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard7, CUTSCENE_NUMBER);

    CutSetMusic(0.0, oPC, 74);
    CutActionCastFakeSpellAtObject(0.0, SPELL_DESTRUCTION, oMeph, oMeph);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 8.0, 70.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutSetCameraSpeed(0.0, oPC, 1.5);
    CutActionMoveToObject(0.0, oPC, oCamera3a, TRUE);
    // killing of the matron's guards
    CutApplyEffectToObject2(3.0, DURATION_TYPE_INSTANT, eFire, oGuard1);
    CutApplyEffectToObject2(3.5, DURATION_TYPE_INSTANT, eKill, oGuard1);
    CutSetCamera(4.0, oPC, CAMERA_MODE_TOP_DOWN, 310.0, 8.0, 60.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutApplyEffectToObject2(3.8, DURATION_TYPE_INSTANT, eFire, oGuard2);
    CutApplyEffectToObject2(4.3, DURATION_TYPE_INSTANT, eKill, oGuard2);
    CutApplyEffectToObject2(4.5, DURATION_TYPE_INSTANT, eFire, oGuard3);
    CutApplyEffectToObject2(5.0, DURATION_TYPE_INSTANT, eKill, oGuard3);
    CutApplyEffectToObject2(5.0, DURATION_TYPE_INSTANT, eFire, oGuard4);
    CutApplyEffectToObject2(5.5, DURATION_TYPE_INSTANT, eKill, oGuard4);
    CutApplyEffectToObject2(6.2, DURATION_TYPE_INSTANT, eFire, oGuard5);
    CutApplyEffectToObject2(6.7, DURATION_TYPE_INSTANT, eKill, oGuard5);
    CutSetCamera(6.6, oPC, CAMERA_MODE_TOP_DOWN, 230.0, 8.0, 60.0, CAMERA_TRANSITION_TYPE_FAST);
    CutApplyEffectToObject2(6.6, DURATION_TYPE_INSTANT, eFire, oGuard6);
    CutApplyEffectToObject2(7.1, DURATION_TYPE_INSTANT, eKill, oGuard6);
    CutApplyEffectToObject2(7.0, DURATION_TYPE_INSTANT, eFire, oGuard7);
    CutApplyEffectToObject2(7.5, DURATION_TYPE_INSTANT, eKill, oGuard7);

    CutFadeOutAndIn(9.0, oPC, 5.0);
    CutAdjustReputation(10.5, oPC, oMatron, -100);
    CutAdjustReputation(10.5, oMatron, oPC, -100);
    CutDestroyObject(10.5, oCopy);
    CutJumpToObject(10.5, oPC, oPCWalk);
    CutSignalEvent(11.0, oMatron, 101);
    CutSetCamera(11.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 20.0, 50.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutDisableCutscene(CUTSCENE_NUMBER, 12.0, 12.0);
    DelayCommand(14.0, AssignCommand(oPC, SetCameraFacing(270.0, 20.0, 50.0)));

}
