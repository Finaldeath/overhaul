#include "NW_I0_Plot"
int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"m1q1_marrokbook"));
    return bCondition;
}

