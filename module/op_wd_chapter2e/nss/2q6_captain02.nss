#include "NW_I0_PLOT"

int StartingConditional()
{
    object oPass = GetItemPossessedBy(GetPCSpeaker(),"M2Q06IAARINPASS");
    if (!GetIsObjectValid(oPass))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
