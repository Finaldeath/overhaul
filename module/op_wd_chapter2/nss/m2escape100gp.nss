#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_Busy",10);
    RewardGP(100,GetPCSpeaker(),FALSE);
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(5.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}
