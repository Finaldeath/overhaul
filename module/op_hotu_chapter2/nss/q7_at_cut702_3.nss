// Camera focus on valsharess for cutscene 702 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    CutSetActiveCutscene(702, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 2.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);

}
