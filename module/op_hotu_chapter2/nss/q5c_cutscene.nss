// Bebelith cutscene
// - Focus on beholder body.
// - Bebelith crashed beholder body.
// - Slowly zoomout on advancing bebelith.
// - End cutscene

#include "x2_inc_cutscene"
int CUTSCENE_NUMBER = 51;

void main()
{
    object oPC = GetEnteringObject();
    if(!GetIsPC(oPC))
        return;

    int nDoOnce = GetLocalInt(GetArea(OBJECT_SELF), "DO_CUTSCENE_ONCE");
    if(nDoOnce == 1)
        return;
    SetLocalInt(GetArea(OBJECT_SELF), "DO_CUTSCENE_ONCE", 1);

    // this var determines whether or not the player arrives from the back tunnel
    int nOtherSide = (GetStringRight(GetTag(OBJECT_SELF), 1) == "2");

    SetLocalInt(GetArea(OBJECT_SELF), "CUTSCENE_PLAYING", 1);
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CUMULATIVE);
    CutSetActiveCutsceneForObject(oPC, CUTSCENE_NUMBER, TRUE);
    object oBody = GetNearestObjectByTag("q5_beholder_body");
    object oBebelith = GetNearestObjectByTag("q5c_bebelith");
    CutSetActiveCutsceneForObject(oBody, CUTSCENE_NUMBER);
    CutSetActiveCutsceneForObject(oBebelith, CUTSCENE_NUMBER);
    object oFace = GetWaypointByTag("q5c_wp_face");
    object oCamera1 = GetWaypointByTag("q5c_camera1");
    object oCamera2;
    //if(nOtherSide)
    //    oCamera2 = GetWaypointByTag("q5c_camera2a");
    //else
        oCamera2 = GetWaypointByTag("q5c_camera2");
    object oCopySP = GetObjectByTag("q5c_copy_sp");
    object oWalkTo = GetWaypointByTag("q5c_bebelith_walkto");
    effect eSlow = EffectSlow();
    object oFliesSound = GetObjectByTag("q5c_FliesLoop");
    DelayCommand(10.0, SoundObjectStop(oFliesSound));
    MusicBackgroundStop(GetArea(OBJECT_SELF));

    object oCopy = CutCreatePCCopy(oPC, GetLocation(oCopySP), "boom");
    CutFadeOutAndIn(0.0, oPC, 3.0);
    CutSetCameraSpeed(0.2, oPC, 0.7);
    CutSetLocation(0.0, oPC);
    CutSetCutsceneMode(0.5, oPC, TRUE, TRUE, TRUE, TRUE);
    CutJumpToObject(0.3, oCopy, oPC);
    CutJumpToObject(0.1, oPC, oCamera1);
    CutSetCamera(0.5, oPC, CAMERA_MODE_TOP_DOWN, 230.0, 0.0, 80.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutApplyEffectToObject2(0.0, DURATION_TYPE_PERMANENT, eSlow, oBebelith);
    CutActionMoveToObject(4.0, oBebelith, oWalkTo, FALSE);
    CutPlaySound(0.0, oPC, "c_spiddire_bat1");

    CutApplyEffectToObject(2.0, DURATION_TYPE_INSTANT, VFX_COM_CHUNK_RED_LARGE, oBody);
    CutPlaySound(0.0, oPC, "cb_ht_chunk");
    CutApplyEffectToObject(0.5, DURATION_TYPE_PERMANENT, VFX_DUR_CUTSCENE_INVISIBILITY, oBody);
    CutSetMusic(0.0, oPC, TRACK_BATTLE_FORESTBOSS);

    CutActionMoveToLocation(1.0, oPC, GetLocation(oCamera2), FALSE);
    //if(nOtherSide)
    //    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 6.0, 100.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    //else
        CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 6.0, 100.0, CAMERA_TRANSITION_TYPE_MEDIUM);
    float fChange;
    /*if(nOtherSide)
    {
        fChange = 5.0;
        CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 180.0, 20.0, 100.0, CAMERA_TRANSITION_TYPE_FAST);
        CutSetCamera(5.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 20.0, 100.0, CAMERA_TRANSITION_TYPE_FAST);
        CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 0.0, 11.0, 100.0, CAMERA_TRANSITION_TYPE_FAST);
    }*/
    CutSetFacingPoint(6.0 - fChange, oBebelith, GetTag(oFace));
    //CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 45.0, 10.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);

    CutPlaySound(0.0, oPC, "c_devil_bat1");
    CutDestroyObject(0.0, oBody);
    CutFadeOutAndIn(5.0, oPC, 2.5);
    CutAdjustReputation(0.0, oPC, oBebelith, -100);
    CutAdjustReputation(0.0, oBebelith, oPC, -100);
    if(nOtherSide)
        CutSetFacingPoint(1.0, oBebelith, GetTag(oCopy));

    CutDisableCutscene(CUTSCENE_NUMBER, 0.0, 0.0);


}
