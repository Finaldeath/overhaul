#include "NW_I0_Plot"
#include "NW_J_FETCH"

void main()
{
    SetLocalInt(GetModule(), "m2q3E_ErikQuestComplete", TRUE);
    SetLocalInt(Global(), "NW_J_FETCHPLOT", 99);

    RewardGP(650,GetPCSpeaker());
    RewardXP(GetPlotTag(),100,GetPCSpeaker());

    if (PlayerHasFetchItem(GetPCSpeaker()) == TRUE)
    {
        TakeFetchItem(GetPCSpeaker());
    }
}
