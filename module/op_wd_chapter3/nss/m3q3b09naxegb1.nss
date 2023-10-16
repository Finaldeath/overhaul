//////Give XP and end plot
#include "NW_I0_PLOT"

void main()
{
      if (GetLocalInt(GetModule(),"NW_G_NaxPlot") !=99)
        {
            RewardXP("M3Q3BFreeNax",100,GetPCSpeaker());
            SetLocalInt(GetModule(),"NW_G_NaxPlot",99);
        }
}
