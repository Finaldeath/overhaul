// Camera focus on valsharess for cutscene 702 inside the dialog

#include "x2_inc_cutscene"

void main()
{
    object oPC = GetLocalObject(GetModule(), "X2_CUT702_PC");
    CutSetActiveCutscene(702, CUT_DELAY_TYPE_CONSTANT, FALSE);
    CutPlayAnimation(0.0, OBJECT_SELF, ANIMATION_LOOPING_TALK_FORCEFUL, 4.0);
}
