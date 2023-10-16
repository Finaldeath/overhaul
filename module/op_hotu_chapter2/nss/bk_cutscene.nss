// Gel cube cutscene:
// Zoom on drow scout yelling at the player.
// Gel cube coming from behind.
// Scout turns around right before the gel cube engulfs him.
// Scout yells as camera turns to the other side of the advancing cube.
// A skeleton drops out from the other side to the ground.

#include "x2_inc_cutscene"

int CUTSCENE_NUMBER = 81;

void CallSetStatus(int nCutscene, object oObject, int nVal)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        SetLocalInt(oObject, "STATUS", nVal);
    }
}

void CutSetStatus(float fDelay, object oObject, int nVal)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallSetStatus(nCutscene, oObject, nVal));
}

void CallSetAppearance(int nCutscene, object oObject)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        SetCreatureAppearanceType(oObject, APPEARANCE_TYPE_SKELETON_COMMON);
    }
}

void CutSetAppearance(float fDelay, object oObject)
{
    int nCutscene = GetActiveCutsceneNum();
    fDelay = CutCalculateCurrentDelay(fDelay, nCutscene);
    DelayCommand(fDelay, CallSetAppearance(nCutscene, oObject));
}

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;
    int nDoOnce = GetLocalInt(OBJECT_SELF, "DO_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(OBJECT_SELF, "DO_ONCE", 1);

    object oCube = GetObjectByTag("bk_gel_cube");
    object oCubeGoTo1 = GetWaypointByTag("bk_wp_cube_goto1");
    object oCubeGoTo2 = GetWaypointByTag("bk_wp_cube_goto2");
    object oCamera1 = GetWaypointByTag("bk_camera1");
    object oScout = GetObjectByTag("bk_DrowScout2");
    SetLocalInt(oScout, "STATUS", 1);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    CutSetActiveCutsceneForObject(oCube, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oScout, CUTSCENE_NUMBER);
    CutFadeOutAndIn(0.0, oPC, 2.5);
    CutSetCutsceneMode(1.0, oPC, TRUE, TRUE, TRUE, TRUE);
    CutSetLocation(0.0, oPC);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    // Camera zooms on the scout
    CutJumpToObject(1.0, oPC, oCamera1);
    CutSetCamera(0.2, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 3.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    // scout's first line...
    CutActionStartConversation(2.0, oScout, oScout, "bk_scout");
    CutPlayAnimation(1.0, oScout, ANIMATION_LOOPING_TALK_FORCEFUL, 3.0);
    CutActionMoveToObject(1.0, oCube, oCubeGoTo1, FALSE);
    CutSetStatus(2.5, oScout, 2);
    // scout's second line...
    CutActionStartConversation(1.0, oScout, oScout, "bk_scout");
    //CutPlayAnimation(1.0, oScout, ANIMATION_LOOPING_TALK_LAUGHING, 5.0);
    CutActionMoveToObject(0.0, oCube, oCubeGoTo2, FALSE);
    CutSetStatus(4.0, oScout, 3);
    // scout hears the sound
    CutActionStartConversation(1.0, oScout, oScout, "bk_scout");
    CutSetFacingPoint(3.0, oScout, GetTag(oCube));
    CutSetMusic(0.0, oPC, TRACK_BATTLE_CITY3);
    CutSetStatus(0.0, oScout, 4);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 10.0, 50.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    // pray in elven...
    CutActionStartConversation(1.5, oScout, oScout, "bk_scout");
    CutPlayAnimation(1.2, oScout, ANIMATION_LOOPING_SPASM, 6.0);
    CutPlaySound(0.0, oPC, "vs_favhen4m_dead");
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 16.0, 0.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutPlaySound(0.5, oPC, "vs_favhen5m_dead");
    CutSetCamera(1.5, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 16.0, 0.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutPlaySound(0.5, oPC, "vs_favhen4m_dead");
    CutSetAppearance(0.0, oScout);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 6.0, 100.0, CAMERA_TRANSITION_TYPE_VERY_FAST);
    CutApplyEffectToObject2(1.0, DURATION_TYPE_INSTANT, EffectDeath(), oScout);
    CutFadeOutAndIn(3.0, oPC, 2.5);
    CutAdjustReputation(0.0, oCube, oPC, -50);
    CutAdjustReputation(0.0, oPC, oCube, -50);
    CutDisableCutscene(CUTSCENE_NUMBER, 1.0, 1.0);
}
