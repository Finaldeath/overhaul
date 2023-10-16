// Camera focus on valsharess afor cutscene 703 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT703_PC");
    CutSetActiveCutscene(703, CUT_DELAY_TYPE_CONSTANT, FALSE);
    object oCamera2 = GetWaypointByTag("q7b3_wp_camera2");

}
