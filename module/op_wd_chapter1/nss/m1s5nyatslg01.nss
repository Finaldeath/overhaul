#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
        RewardXP("m1q1_Zoo",100,GetPCSpeaker());
    }
    DestroyObject(GetObjectByTag("M1S5ABear1"));
    DestroyObject(GetObjectByTag("M1S5APanther"));
    DestroyObject(GetObjectByTag("M1S5ALion"));
    DestroyObject(GetObjectByTag("M1S5AWolf"));
}
