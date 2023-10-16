//::///////////////////////////////////////////////
//:: PC has head and hammer
//:: con_grd_headhamm
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the chieftain's head and hammer
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;
    iResult = os_CheckItem("q3_itm_duerhead")
        && os_CheckItem("q3_itm_duerhamm");
    return iResult;
}
