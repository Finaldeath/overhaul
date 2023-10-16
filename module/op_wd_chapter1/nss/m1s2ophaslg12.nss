#include "NW_I0_Plot"
void main()
{

    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
        RewardXP("m1q1_Theft",100,GetPCSpeaker());
    }
}
