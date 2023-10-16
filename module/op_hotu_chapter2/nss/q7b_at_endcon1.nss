// End of first Valsharess dialog (greeting player):
// Continue with cutscene 701:
// - matron leaves room
// - player follows matron.
// - devil stops the player
// - player moves back to the devil.
// - init dialog with devil
// - dialog ends
// - CONTINUE CUTSCENE AT SCRIPT: "q7b_at_endcon2"
// - matron returns to the room.
// - matron stops at the middle of the room.
// - matron gives a one liner.
// - init player-matron dialog (inv object)
// - matron orders guards to attack.
// - devil speaks one line and kills all her guards.
// - matron gets angry and attacks.
// - fight! fight! fight!

#include "x2_inc_cutscene"
int CUTSCENE_NUMBER = 701;

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
    object oMeph = GetObjectByTag("q7_meph");
    object oMatronExit = GetWaypointByTag("q7b2_wp_matron_exit");
    object oCopy = GetObjectByTag("q7b2_pc_copy");
    float fConvDurMeph2 = CutGetConvDuration("q7_cut_meph2a"); // meph agreeing to summon player
    object oPCWalk = GetWaypointByTag("q7b2_wp_pc_walk");
    object oPCExit = GetWaypointByTag("q7b2_wp_pc_exit");
    object oDeekinWalk = GetWaypointByTag("q7b2_wp_deekin_walk");
    object oDeekin;
    if(GetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE") == 1)
    {
        oDeekin = GetObjectByTag("x2_hen_deekin");
    }

    // matron leaves and player follows
    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 8.0, 100.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutActionMoveToObject(0.0, oMatron, oMatronExit, FALSE);
    CutSetFacingPoint(0.5, oCopy, GetTag(oMatron));
    CutActionMoveToObject(2.5, oCopy, oPCExit, FALSE);
    if(oDeekin != OBJECT_INVALID)
    {
        CutSetFacingPoint(2.7, oDeekin, GetTag(oPCExit));
        CutActionMoveToObject(3.7, oDeekin, oPCExit, FALSE);
        CutClearAllActions(7.5, oDeekin, TRUE);
        CutSetFacingPoint(8.0, oDeekin, GetTag(oMeph));
        CutActionMoveToObject(8.5, oDeekin, oDeekinWalk, FALSE);
        CutSetFacingPoint(10.0, oDeekin, GetTag(oMeph));
    }
    // meph talks to the player
    CutSetCamera(4.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutActionStartConversation(4.5, oMeph, oMeph, "q7_cut_meph2a");
    // player stops and returns to the platform.
    CutSetCamera(6.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 16.0, 70.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutClearAllActions(6.5, oCopy, TRUE);
    CutSetFacingPoint(7.0, oCopy, GetTag(oMeph));
    CutActionMoveToObject(7.5, oCopy, oPCWalk, FALSE);
    CutSetCamera(12.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutBeginConversation(12.0, oMeph, oPC, "q7_cut_meph3a");
}
