/// Checks if War Golems both still active

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_GOLEMS_KILLED") < 2
        && GetLocalInt(GetModule(), "NW_G_M4Q01_CATAPULTS") >= 3 ;

    return iResult;
}

