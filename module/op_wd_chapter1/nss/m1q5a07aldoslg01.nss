#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(GetModule(),"NW_G_PlotAldo") < 30)
    {
        SetLocalInt(GetModule(),"NW_G_PlotAldo",30);
    }
    if(GetLocalInt(OBJECT_SELF,"NW_L_RewardGiven") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_RewardGiven",TRUE);
        RewardXP("M1Q5_Aldo",100,GetPCSpeaker());
    }

}
