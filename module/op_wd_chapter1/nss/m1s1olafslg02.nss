#include "NW_I0_Plot"
void main()

{
    if(GetLocalInt(OBJECT_SELF,"NW_L_XPGiven") == FALSE)
    {
        RewardXP("m1q1_Never",50,GetPCSpeaker());
        SetLocalInt(OBJECT_SELF,"NW_L_XPGiven",TRUE);
    }
    SetLocalInt(GetModule(),"NW_G_M1S1SubPlot",100);
    DestroyObject(GetObjectByTag("M1S1ABriley"));
}

