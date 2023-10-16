///////Check if PC has amulet (not complete) on them and has a normal int

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = CheckIntelligenceNormal() &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_BROKENAGES")) &&
              GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M3Q3C_FIXEDAGES"));

    return iResult;
}
