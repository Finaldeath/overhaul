#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_M1Q5A07RewardGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1Q5A07RewardGiven",TRUE);
        RewardXP("M1Q5_Aldo",100,GetPCSpeaker());
    }
}
