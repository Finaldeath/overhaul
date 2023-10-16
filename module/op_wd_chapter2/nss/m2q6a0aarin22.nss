// checks to see if the player has one of the seals from the High Captains

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oSeal = GetItemPossessedBy(GetPCSpeaker(),"M2Q6A0SEAL");
    if (GetIsObjectValid(oSeal))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
