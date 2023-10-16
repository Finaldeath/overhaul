//::///////////////////////////////////////////////
//:: os_con_ban_trp2
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
    if (TryBanterWith("os_hen_trp", 2) == TRUE)
    {
        return TRUE;
    }
    return FALSE;


}
