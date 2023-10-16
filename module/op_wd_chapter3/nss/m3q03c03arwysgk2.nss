///////Check if PC has amulet on them and has a NORMAL int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES")) ||
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_SWORDAGES")));

    return iResult;
}


