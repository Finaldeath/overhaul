//Sphinx has asked riddles. Give XP to PC.
#include "nw_i0_plot"
void main()
{
    SetLocalInt(GetPCSpeaker(),"X1_SPHINXRIDDLES",10);
    RewardXP("xpmid",100,GetPCSpeaker());
}
