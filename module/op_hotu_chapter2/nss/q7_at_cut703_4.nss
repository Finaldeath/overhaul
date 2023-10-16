// Camera focus on valsharess for cutscene 703 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT703_PC");
    CutSetActiveCutscene(703, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 0.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);

}
