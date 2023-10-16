#include "nw_i0_plot"

void main()
{
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1Q04INOBAMULET"),GetPCSpeaker());
    AutoAlignE(DC_EASY, GetPCSpeaker());
}
