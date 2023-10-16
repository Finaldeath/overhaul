///////Check if PC has completed amulet

#include "NW_I0_PLOT"

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q3CA_AMULET")==1;

    return iResult;
}

