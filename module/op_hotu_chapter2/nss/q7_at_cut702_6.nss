// Camera focus on valsharess for cutscene 702 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    CutSetCameraSpeed(0.0, oPC, 0.2);
    CutSetActiveCutscene(702, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 300.0, 0.0, 90.0, CAMERA_TRANSITION_TYPE_SLOW);
    CutActionMoveToObject(0.0, oPC, OBJECT_SELF, FALSE);
    CutPlayAnimation(11.5, OBJECT_SELF, ANIMATION_FIREFORGET_TAUNT, 1.0);
}
