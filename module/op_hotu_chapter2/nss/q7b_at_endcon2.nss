// End of devil dialog dialog (talking behind the back of the matron):
// Continue with cutscene 701:
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
    object oMatron = GetObjectByTag("q7_matron");
    object oMeph = GetObjectByTag("q7_meph");
    object oMatronReturn = GetWaypointByTag("q7b2_wp_matron_return");
    object oCopy = GetObjectByTag("q7b2_pc_copy");
    object oDeekin;
    if(GetLocalInt(GetModule(), "X2_DEEKIN_ALIVE_AFTER_SIEGE") == 1)
    {
        oDeekin = GetObjectByTag("x2_hen_deekin");
    }

    CutSetActiveCutscene(CUTSCENE_NUMBER, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutJumpToObject(0.0, oMatron, oMatronReturn);
    CutSetCamera(1.0, oPC, CAMERA_MODE_TOP_DOWN, 90.0, 16.0, 80.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutSetFacingPoint(2.0, oCopy, GetTag(oMatron));
    if(oDeekin != OBJECT_INVALID)
    {
        CutSetFacingPoint(2.5, oDeekin, GetTag(oMatron));
    }
    CutBeginConversation(2.5, oMatron, oPC, "q7_cut_val6a");
}
