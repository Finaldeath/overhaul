#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetModule(), "M2Q1A00SAILPLOT", 30);
    RewardGP(200, GetPCSpeaker());
    RewardXP("PriMngXP",100, GetPCSpeaker());
}

