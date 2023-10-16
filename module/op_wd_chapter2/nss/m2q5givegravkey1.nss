#include "NW_I0_PLOT"

void main()
{
    TakeGold(50,GetPCSpeaker());
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M2Q05IGRAVEKEY"),GetLastSpeaker());
}
