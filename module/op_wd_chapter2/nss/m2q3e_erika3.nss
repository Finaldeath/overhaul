#include "NW_I0_Plot"
#include "NW_J_FETCH"

void main()
{
   SetLocalInt(Global(), "NW_J_FETCHPLOT", 99);

    if (PlayerHasFetchItem(GetPCSpeaker()))
    {
        TakeFetchItem(GetPCSpeaker());
    }

    RewardGP(400,GetPCSpeaker());
    RewardXP(GetPlotTag(),100,GetPCSpeaker());

    SetLocalInt(GetModule(), "m2q3E_ErikQuestComplete", TRUE);
}
