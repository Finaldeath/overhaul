#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"RESC_RING01"));
    return bCondition;
}

