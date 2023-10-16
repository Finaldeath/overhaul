//::///////////////////////////////////////////////
//:: PC Has Head
//:: con_ser_haschief
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has the goblin chieftain's head
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: August 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckItem("q3_itm_chiefhead");
    return iResult;
}
