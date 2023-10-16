//// Checks if Gend and PC is a romance

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET2"));
    return iResult;
}

