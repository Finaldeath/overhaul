// Torias takes the bottle

#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetModule(), "q5a_Torias_Wine", 3);
    object oBottle = GetItemPossessedBy(GetPCSpeaker(), "q5b_bottle");
    DestroyObject(oBottle);
    RewardXP("xpmid", 100, GetPCSpeaker());
}
