#include "nw_i0_plot"

void main()
{
    ActionTakeItem(GetItemPossessedBy(GetLastSpeaker(),"M2Q05IBUGBHEAD"),GetLastSpeaker());
    RewardGP(200, GetPCSpeaker());
    RewardXP("m2q5_Goblin",100,GetPCSpeaker());
}
