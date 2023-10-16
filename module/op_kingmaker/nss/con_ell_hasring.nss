//::///////////////////////////////////////////////
//:: PC has Ring
//:: con_ell_hasring
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC has Sir Beckett's Ring
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////
#include "os_include"
int StartingConditional()
{
    int iResult;

    iResult = os_CheckItem("q2_itm_beckring");
    return iResult;
}
