// Xanos is currently the PC's henchman
#include "x1_inc_plot"

int StartingConditional()
{
    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, GetPCSpeaker());
    return GetTag(oHenchman) == "x0_hen_dor";
}
