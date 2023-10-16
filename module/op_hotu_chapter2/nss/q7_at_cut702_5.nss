// Camera focus on valsharess and meph for cutscene 702 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    CutSetActiveCutscene(702, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 60.0, 4.0, 100.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutPlayAnimation(0.0, OBJECT_SELF, ANIMATION_FIREFORGET_TAUNT, 1.0);
}
