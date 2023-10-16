#include "nw_i0_plot"
void main()
{
    int nUser = GetUserDefinedEventNumber();

    if(nUser == 1007)
    {
        object oKiller = GetLastKiller();
        RewardXP("M4Q01_SIEGE",20,oKiller);
    }
}
