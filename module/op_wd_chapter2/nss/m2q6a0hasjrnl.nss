// checks to see if the player has any of the location-related cult info
// available in Chapter 2

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oJournal1 = GetItemPossessedBy(GetPCSpeaker(),"M2Q3G_CULTJOURN");
    object oJournal2 = GetItemPossessedBy(GetPCSpeaker(),"M2Q2GJRNRELMAR");
    object oJournal3 = GetItemPossessedBy(GetPCSpeaker(),"M2Q1VARDLET");

    if (GetIsObjectValid(oJournal1) ||
       GetIsObjectValid(oJournal2) ||
       GetIsObjectValid(oJournal3))
       {
        return TRUE;
    }
    return FALSE;
}
