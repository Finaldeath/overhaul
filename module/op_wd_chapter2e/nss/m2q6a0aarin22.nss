// checks to see if the player has one of the seals from the High Captains

#include "NW_I0_PLOT"

int StartingConditional()
{
    object oSeal = GetItemPossessedBy(GetPCSpeaker(),"M2Q6A0SEAL");
    int iPlot = GetLocalInt(OBJECT_SELF,"Chapter2_Aarin_Made_Forgery");
    if (GetIsObjectValid(oSeal) && (iPlot == 0))
    {
        return CheckIntelligenceNormal();
    }
    return FALSE;
}
