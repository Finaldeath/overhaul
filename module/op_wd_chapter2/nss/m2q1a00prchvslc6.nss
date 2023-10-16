#include "nw_i0_plot"

void main()
{
    SetLocalInt(GetModule(), "M2Q1A00SAILPLOT", 60);
    RewardGP(50, GetPCSpeaker());
    RewardXP("PriMngXP",100, GetPCSpeaker());
}
