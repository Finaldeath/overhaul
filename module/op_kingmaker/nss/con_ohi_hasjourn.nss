//::///////////////////////////////////////////////
//:: PC has Journal
//:: con_ohi_hasjourn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has found the journal
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Oct 2003
//:://////////////////////////////////////////////

#include "os_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckItem("q3_itm_archjourn");
    return iResult;
}
