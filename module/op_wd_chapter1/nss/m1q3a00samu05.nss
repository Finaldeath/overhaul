#include "NW_I0_Plot"
void main()
{
    SetLocalInt(GetModule(),"NW_Thurin_Plot",100);
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
        RewardXP("m1q3_Samuel",100,GetPCSpeaker());
    }
}
