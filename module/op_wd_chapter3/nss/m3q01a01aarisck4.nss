///////Check if player has romance, not advanced and low int

#include "NW_I0_PLOT"
int StartingConditional()
{
    int iResult;

    iResult =  CheckIntelligenceLow() &&
               GetLocalInt(GetPCSpeaker(),"GENDROMANCE") != 99 &&
               GetLocalInt(GetPCSpeaker(),"GENDROMANCE") != 1 &&

              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"AARIN_AMULET"));

    return iResult;
}


