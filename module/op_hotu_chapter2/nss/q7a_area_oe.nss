// Siege won cutscene:
// Seer talks to the player outside of the Valsharess' fortress
// Player vanishes.
// camera jumps to seer's throne room showing her asking for the devil to bring the pc
// player appears in the throne room
// matron moves towards the player, taunting him.
// players tries to leave the summoning circle and fails.
// matron laughes
// matron commands meph to destroy the player.
// meph refuses and destoryes her gaurds instead.
// matron moves angrily towards meph screaming for explanations
// meph talks a bit and releases the player from the circle.
// fight! fight! fight!

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
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_CUTSCENE_ONCE", 1);

    SetCustomToken(77001, GetStringByStrRef(StringToInt(Get2DAString("racialtypes", "Name", GetRacialType(oPC)))));
    if(GetGender(oPC) == GENDER_MALE)
    {
        SetCustomToken(77002, GetStringByStrRef(4924));
        SetCustomToken(77003, GetStringByStrRef(4875));
        //SetCustomToken(77002, "male");
        //SetCustomToken(77003, "him");
    }
    else
    {
        SetCustomToken(77002, GetStringByStrRef(4925));
        SetCustomToken(77003, GetStringByStrRef(4876));
        //SetCustomToken(77002, "female");
        //SetCustomToken(77003, "her");
    }
    object oMale = GetObjectByTag("q7_male");
    if(oMale != OBJECT_INVALID)
        DestroyObject(oMale); // should habe been destroyed in one of the interjection cutscenes
    object oSeer = GetObjectByTag("q7_seer");
    object oCopySP = GetWaypointByTag("q7a_wp_pc");
    object oCamera1 = GetWaypointByTag("q7a_wp_camera1");
    object oCamera2 = GetWaypointByTag("q7a_wp_camera2");
    float fConvDur = CutGetConvDuration("q7_cut_seer"); // seer's initial dialog duration
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
    effect eVis = EffectVisualEffect(VFX_IMP_DEATH_L);
    effect eVis2 = EffectVisualEffect(VFX_COM_CHUNK_RED_SMALL);
    eKill = EffectLinkEffects(eKill, eVis);
    if(GetGameDifficulty() == GAME_DIFFICULTY_DIFFICULT || GetGameDifficulty() == GAME_DIFFICULTY_CORE_RULES)
        eKill = EffectLinkEffects(eKill, eVis2);
    object oFace1 = GetWaypointByTag("q7b_wp_face1");
    object oFace2 = GetWaypointByTag("q7b_wp_face2");

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oSeer, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oMeph, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oMatron, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oCircle, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard1, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard2, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard3, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard4, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard5, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard6, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oGuard7, CUTSCENE_NUMBER);
    CutSetAbortDelay(CUTSCENE_NUMBER, 2.0);
    CutSetDestroyCopyDelay(CUTSCENE_NUMBER, 2.0);
    CutFadeOutAndIn(0.0, oPC, 4.0);
    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "q7_pc_copy");
    CutSetCutsceneMode(1.5, oPC, TRUE, CUT_CAMERA_HEIGHT_MEDIUM, FALSE, FALSE);
    // remove all henchmen
    int i = 1;
    object oHench = GetHenchman(oPC, i);
    while(oHench != OBJECT_INVALID)
    {
        RemoveHenchman(oPC, oHench);
        i++;
        oHench = GetHenchman(oPC, i);
    }

    // camera moves to rebels gathering in front of tower
    CutSetCamera(2.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCameraSpeed(0.5, oPC, 0.5);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutActionMoveToObject(1.0, oPC, oCamera2, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    //CutSetCamera(10.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutSetCamera(9.0, oPC, CAMERA_MODE_TOP_DOWN, 60.0, 2.5, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // seer talks to the player
    CutBeginConversation(1.0, oSeer, oSeer, "q7_cut_seer");
    // player vanishes
    CutApplyEffectAtLocation(fConvDur, oPC, DURATION_TYPE_INSTANT, 472, GetLocation(oCopySP));
    CutSetFacingPoint(0.0, oSeer, GetTag(oCopy));
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 10.0, 50.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    CutJumpToObject(1.0, oCopy, oTempCopySP);
    // seer's response to the player's vanishing
    //CutPlayAnimation(0.0, oSeer, ANIMATION_FIREFORGET_HEAD_TURN_LEFT, 0.0);
    //CutPlayAnimation(0.3, oSeer, ANIMATION_FIREFORGET_HEAD_TURN_RIGHT, 0.0);
    //CutPlayAnimation(0.3, oSeer, ANIMATION_FIREFORGET_SPASM, 0.0);
    CutSetMusic(0.0, oPC, TRACK_BATTLE_DRAGON);
    CutActionStartConversation(1.5, oSeer, oSeer, "q7_cut_seer2");

    // camera shows the matron and devil
    CutJumpToObject(4.0, oPC, oCamera1a);

    CutFadeOutAndIn(0.0, oPC, 3.0, FADE_SPEED_FAST);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 70.0, 5.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetFacingPoint(0.0, oMatron, GetTag(oMeph));
    // matron demands devil to bring the player
    CutActionStartConversation(5.0, oMatron, oMatron, "q7_cut_val1");
    CutSetMusic(0.0, oPC, TRACK_TEMPLEEVIL);
    CutSetCamera(fConvDurVal1, oPC, CAMERA_MODE_TOP_DOWN, 330.0, 0.0, 110.0, CAMERA_TRANSITION_TYPE_FAST);
    CutActionStartConversation(0.0, oMatron, oMatron, "q7_cut_val2");
    CutPlayAnimation(0.5, oMatron, ANIMATION_LOOPING_TALK_FORCEFUL, 9.0);
    CutSetCamera(fConvDurVal2, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCameraSpeed(0.0, oPC, 0.1);
    // devil agrees
    CutActionStartConversation(2.0, oMeph, oMeph, "q7_cut_meph1");
    CutActionMoveToObject(0.5, oPC, oCamera2a, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    // devil summons player
    CutActionCastFakeSpellAtObject(3.0, SPELL_GATE, oMeph, oMeph);
    CutSetCamera(3.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetCameraSpeed(0.0, oPC, 0.6);
    CutActionMoveToLocation(0.0, oPC, GetLocation(oCamera3a), FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 270.0, 4.0, 70.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    // visual effects on summoning circle
    CutSignalEvent(1.0, oCircle, 101);
    CutSetFacingPoint(0.0, oMatron, GetTag(oCircle));
    CutApplyEffectAtLocation(3.0, oPC, DURATION_TYPE_INSTANT, 471, GetLocation(oPCJump));
    // player appears in throne room
    CutJumpToObject(0.0, oCopy, oPCJump);
    //CutSetFacingPoint(1.0, oCopy, GetTag(oFace1));
    //CutSetFacingPoint(0.6, oCopy, GetTag(oFace2));
    //CutSetFacingPoint(0.6, oCopy, GetTag(oMatron));

    CutSetCamera(2.5, oPC, CAMERA_MODE_TOP_DOWN, 100.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    //CutApplyEffectToObject2(0.0, DURATION_TYPE_TEMPORARY, EffectSlow(), oMatron, 6.0);
    // matron moves to the player
    CutActionMoveToLocation(1.0, oMatron, GetLocation(oMatronWalk), FALSE);
    // matron taunts the player
    //CutActionStartConversation(5.0, oMatron, oMatron, "q7_cut_val3");
    CutBeginConversation(5.0, oMatron, oPC, "q7_cut_val3");
}

