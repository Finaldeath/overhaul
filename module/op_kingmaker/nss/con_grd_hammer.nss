//::///////////////////////////////////////////////
//:: PC has just head
//:: con_grd_hammer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the mage's head
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;
    iResult = os_CheckItem("q3_itm_duerhead");
    return iResult;
}
