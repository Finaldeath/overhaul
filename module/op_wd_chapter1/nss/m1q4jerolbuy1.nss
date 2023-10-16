#include "NW_I0_Plot"
void main()
{
    TakeGold(150,GetPCSpeaker());
    SetLocalInt(OBJECT_SELF,"NW_L_M1Q4JerolCoins",GetLocalInt(OBJECT_SELF,"NW_L_M1Q4JerolCoins") + 1);
    CreateItemOnObject("M1Q04ISMUGCOIN",GetLastSpeaker());
}
