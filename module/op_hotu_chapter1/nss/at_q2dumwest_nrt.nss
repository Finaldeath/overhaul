//at_q2dumwest_nrt
#include "x0_i0_henchman"
void main()
{
    object oClicker = GetClickingObject();
    object oTarget = GetTransitionTarget(OBJECT_SELF);

    SetAreaTransitionBMP(AREA_TRANSITION_RANDOM);

    object oNath = GetObjectByTag("x2_hen_nathyrra");
    if (GetIsObjectValid(GetMaster(oNath)) == TRUE)
        FireHenchman(GetMaster(oNath), oNath);

    AssignCommand(oClicker,JumpToObject(oTarget));
}
