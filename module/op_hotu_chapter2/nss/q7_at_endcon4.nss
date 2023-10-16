// End dialog of matron taunting the trapped player in the circle.
// Continue with cutscene 71:

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 71;

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
    object oCamera1a = GetWaypointByTag("q7b_wp_camera1");
    object oCamera2a = GetWaypointByTag("q7b_wp_camera2");
    object oCamera3a = GetWaypointByTag("q7b_wp_camera3");
    object oCamera4a = GetWaypointByTag("q7b_wp_camera4");
    object oCamera5a = GetWaypointByTag("q7b_wp_camera5");
    object oTempCopySP = GetWaypointByTag("q7b_wp_temp_copy");
    object oMatron = GetObjectByTag("q7_matron");
    object oMatronWalk = GetWaypointByTag("q7b_wp_matron1");
    float fConvDurVal1 = CutGetConvDuration("q7_cut_val1"); // matron asks meph to bring player
    float fConvDurVal2 = CutGetConvDuration("q7_cut_val2"); // matron asks meph to bring player part 2
    float fConvDurVal3 = CutGetConvDuration("q7_cut_val3"); // matron taunts trapped player
    float fConvDurVal4 = CutGetConvDuration("q7_cut_val4"); // matron laughes at trapped player after he failed to exit circle
    float fConvDurVal5 = CutGetConvDuration("q7_cut_val5"); // matron commands meph to kill player
    float fConvDurVal6 = CutGetConvDuration("q7_cut_val6"); // matron yells at meph for refusing
    float fConvDurVal7 = CutGetConvDuration("q7_cut_val7"); // matron yells at meph for refusing after moving towards him
    float fConvDurMeph1 = CutGetConvDuration("q7_cut_meph1"); // meph agreeing to summon player
    float fConvDurMeph2 = CutGetConvDuration("q7_cut_meph2"); // meph refusing to kill the player and kills guards instead
    float fConvDurMeph3 = CutGetConvDuration("q7_cut_meph3"); // meph laughing at the matron saying he would release the player
    object oGuard1 = GetObjectByTag("q7_guard1");
    object oGuard2 = GetObjectByTag("q7_guard2");
    object oGuard3 = GetObjectByTag("q7_guard3");
    object oGuard4 = GetObjectByTag("q7_guard4");
    object oGuard5 = GetObjectByTag("q7_guard5");
    object oGuard6 = GetObjectByTag("q7_guard6");
    object oGuard7 = GetObjectByTag("q7_guard7");
    object oMeph = GetObjectByTag("q7_meph");
    object oPent1 = GetNearestObjectByTag("q7_pent", oMeph, 1);
    object oPent2 = GetNearestObjectByTag("q7_pent", oMeph, 2);
    object oPent3 = GetNearestObjectByTag("q7_pent", oMeph, 3);
    object oPent4 = GetNearestObjectByTag("q7_pent", oMeph, 4);
    object oPent5 = GetNearestObjectByTag("q7_pent", oMeph, 5);
    object oPCJump = GetWaypointByTag("q7b_wp_pc_sp");
    object oCircle = GetObjectByTag("q7b_circle");
    object oHiddenWP = GetWaypointByTag("q7b_wp_temp_copy");
    object oMatronRun = GetWaypointByTag("q7_wp_matron_run");
    object oEscWP = GetWaypointByTag("q7b_wp_pc_walk1"); // player tries to exit summoning circle through this wp
    effect eKill = EffectDeath();
    effect eFire = EffectVisualEffect(VFX_IMP_DIVINE_STRIKE_FIRE);
    //effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
    effect eVis2 = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    //eKill = EffectLinkEffects(eKill, eVis);
    if(GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES)
        eKill = EffectLinkEffects(eKill, eVis2);

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE, FALSE);
    CutSetActiveCutsceneForObject(oPent1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPent2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPent3, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPent4, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oPent5, CUTSCENE_NUMBER);

    object oCopy = GetObjectByTag("q7_pc_copy");
    // Initializing the global cutscene cumulative delay since we start again after the dialog
    string sDelayVariable = "X2_fCutscene" + IntToString(CUTSCENE_NUMBER) + "Delay";
    SetLocalFloat(GetModule(), sDelayVariable, 0.0);

    CutSetCameraSpeed(0.0, oPC, 1.0);
    // player tries to exit summoning circle
    CutActionMoveToObject(0.5, oCopy, oEscWP, TRUE);
    // player fails to exit the circle
    CutApplyEffectToObject2(0.5, DURATION_TYPE_TEMPORARY, EffectKnockdown(), oCopy, 5.0);
    CutPlayVoiceChat(0.0, oPC, VOICE_CHAT_PAIN1);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, VFX_IMP_MAGBLUE, oCopy);
    // matron laughs at the player
    CutActionStartConversation(1.0, oMatron, oMatron, "q7_cut_val4");
    CutPlayAnimation(0.3, oMatron, ANIMATION_LOOPING_TALK_LAUGHING, 1.5);
    CutSetFacingPoint(fConvDurVal4 - 0.3, oMatron, GetTag(oMeph));
    CutJumpToObject(1.0, oPC, oCamera4a);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 290.0, 2.0, 80.0, CAMERA_TRANSITION_TYPE_SNAP);
    // matron demands devil to kill the player
    CutActionStartConversation(1.0, oMatron, oMatron, "q7_cut_val5");

    CutJumpToObject(fConvDurVal5, oPC, oCamera5a);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 3.5, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionStartConversation(1.0, oMeph, oMeph, "q7_cut_meph2");
    CutSetMusic(0.0, oPC, 74);
    // devil refuses to kill the player and starts killing the matron's guards
    CutActionCastFakeSpellAtObject(fConvDurMeph2, SPELL_DESTRUCTION, oMeph, oMeph);
    CutJumpToObject(3.0, oPC, oCamera3a);
    // killing of the matron's guards
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 8.0, 60.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutApplyEffectToObject2(1.0, DURATION_TYPE_INSTANT, eFire, oGuard1);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard1);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 310.0, 8.0, 60.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutApplyEffectToObject2(0.3, DURATION_TYPE_INSTANT, eFire, oGuard2);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard2);

    CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, eFire, oGuard3);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard3);

    CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, eFire, oGuard4);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard4);

    CutApplyEffectToObject2(1.0, DURATION_TYPE_INSTANT, eFire, oGuard5);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard5);

    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 230.0, 8.0, 60.0, CAMERA_TRANSITION_TYPE_FAST);

    CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, eFire, oGuard6);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard6);

    CutApplyEffectToObject2(0.0, DURATION_TYPE_INSTANT, eFire, oGuard7);
    CutApplyEffectToObject2(0.5, DURATION_TYPE_INSTANT, eKill, oGuard7);
    CutJumpToObject(3.0, oPC, oCamera4a);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // matron yells at the devil
    CutActionStartConversation(1.0, oMatron, oMatron, "q7_cut_val6");
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // matron runs towards the devil
    CutActionMoveToObject(0.0, oMatron, oMatronRun, TRUE);
    CutJumpToObject(3.0, oPC, oCamera1a);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 110.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // devil says he would release the player
    CutActionStartConversation(1.0, oMatron, oMatron, "q7_cut_val7");
    CutPlayAnimation(0.1, oMatron, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
    CutActionStartConversation(fConvDurVal7, oMeph, oMeph, "q7_cut_meph3");
    CutActionCastFakeSpellAtObject(fConvDurMeph3, SPELL_MORDENKAINENS_DISJUNCTION, oMeph, oMeph);
    CutSetFacingPoint(1.0, oMatron, GetTag(oCopy));
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 14.0, 50.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(0.0, oPC, oEscWP, TRUE);
    // releasing the player from the circle
    CutApplyEffectToObject(3.0, DURATION_TYPE_INSTANT, 467 , oPent1, 2.0);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, 467 , oPent2, 2.0);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, 467 , oPent3, 2.0);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, 467 , oPent4, 2.0);
    CutApplyEffectToObject(0.0, DURATION_TYPE_INSTANT, 467 , oPent5, 2.0);
    CutPlaySound(0.0, oPC, "sff_strkholy");
    CutSetPlotFlag(0.0, oCircle, FALSE);
    CutDestroyObject(0.5, oCircle);
    CutFadeOutAndIn(1.0, oPC, 4.0);
    CutSignalEvent(0.5, oMatron, 101);
    CutAdjustReputation(1.0, oPC, oMatron, -100);
    CutAdjustReputation(0.0, oMatron, oPC, -100);
    CutDestroyObject(0.0, oCopy);
    CutJumpToObject(0.5, oPC, oPCJump);
    CutDisableCutscene(CUTSCENE_NUMBER, 1.0, 1.0);
}
