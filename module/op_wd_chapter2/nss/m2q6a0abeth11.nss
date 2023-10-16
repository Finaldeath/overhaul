// checks to see if the player has any of the cult-related information
// available in Chapter 2

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oJournal1 = GetItemPossessedBy(GetPCSpeaker(),"M2Q3G_CULTJOURN");
    object oJournal2 = GetItemPossessedBy(GetPCSpeaker(),"M2Q2GJRNRELMAR");
    object oJournal3 = GetItemPossessedBy(GetPCSpeaker(),"M2Q1VARDLET");
    object oHint1 = GetItemPossessedBy(GetPCSpeaker(),"M2Q06ILETTNEVA");
    object oHint2 = GetItemPossessedBy(GetPCSpeaker(),"M2Q06ILETTSOLOMO");
    object oHint3 = GetItemPossessedBy(GetPCSpeaker(),"M2Q5CULTJRNL");
    int iPlot = GetLocalInt(GetModule(),"Chapter2_Know_Cult");

    if ((iPlot == 0) &&
       (GetIsObjectValid(oJournal1) ||
       GetIsObjectValid(oJournal2) ||
       GetIsObjectValid(oJournal3) ||
       GetIsObjectValid(oHint1) ||
       GetIsObjectValid(oHint2) ||
       GetIsObjectValid(oHint3)))
       {
        return CheckIntelligenceLow();
    }
    return FALSE;
}
