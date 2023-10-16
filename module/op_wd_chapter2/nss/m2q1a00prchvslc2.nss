#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetModule(), "M2Q1A00SAILPLOT", 20);
    TakeGold(GetLocalInt(OBJECT_SELF,"NW_L_Payment"),GetPCSpeaker());
}
