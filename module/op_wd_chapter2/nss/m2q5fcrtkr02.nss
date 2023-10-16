#include "NW_I0_PLOT"

int StartingConditional()
{
    object oBook1 = GetItemPossessedBy(GetPCSpeaker(), "M2Q01TIMASKDEATH");
    object oBook2 = GetItemPossessedBy(GetPCSpeaker(), "M2Q01TIMASKFIRE");
    object oBook3 = GetItemPossessedBy(GetPCSpeaker(), "M2Q01TIMASKICE");
    object oBook4 = GetItemPossessedBy(GetPCSpeaker(), "M2Q01TIMASKLIFE");
    object oBook5 = GetItemPossessedBy(GetPCSpeaker(), "M2Q01TIMASKRESON");
    if ((GetIsObjectValid(oBook1)) ||
        (GetIsObjectValid(oBook2)) ||
        (GetIsObjectValid(oBook3)) ||
        (GetIsObjectValid(oBook4)) ||
        (GetIsObjectValid(oBook5)))
    {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
