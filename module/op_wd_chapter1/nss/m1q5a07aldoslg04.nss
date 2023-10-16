#include "NW_I0_Plot"
void main()
{
    if(GetLocalInt(GetModule(),"NW_G_PlotAldo") < 30)
    {
        RewardXP("M1Q5_Aldo",100,GetPCSpeaker());
    }
}

