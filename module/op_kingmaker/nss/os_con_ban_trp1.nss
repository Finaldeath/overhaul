//::///////////////////////////////////////////////
//:: os_con_ban_trp1
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Try to start a conversation with Trip.
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori
//:: Created On:  Nov 2003
//:://////////////////////////////////////////////
#include "os_inc_banter"

int StartingConditional()
{
    if (TryBanterWith("os_hen_trp", 1) == TRUE)
    {
        return TRUE;
    }
    return FALSE;


}
