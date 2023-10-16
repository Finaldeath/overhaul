// * Guzud gives player some gold
#include "nw_i0_plot"

void main()
{
     SetLocalInt(OBJECT_SELF,"NW_L_M3Q02TALKGUZUDGOLD",1);
     RewardGP(500,GetPCSpeaker());
}
