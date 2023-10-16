// Camera focus on valsharess for cutscene 702 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    CutSetActiveCutscene(702, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutSetCamera(0.0, oPC, CAMERA_MODE_TOP_DOWN, 320.0, 2.0, 90.0, CAMERA_TRANSITION_TYPE_SNAP);
    CutPlayAnimation(0.0, OBJECT_SELF, ANIMATION_LOOPING_TALK_FORCEFUL, 8.5);
}
