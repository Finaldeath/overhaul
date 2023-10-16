///// Check if Haedraline talked to at 2 (told to get words of Power)
//////  Player does not have final Word of Power

#include "NW_I0_Plot"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M4Q01_HAEDRALINE_TALKEDTO") ==2
           && !GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"MPlUsWordofPoQ6"));


    return iResult;
}
