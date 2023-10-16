//::///////////////////////////////////////////////
//:: os_con_ban_kai2
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Try to start a conversation with Kaidala.
*/
//:://////////////////////////////////////////////
//:: Created By:  Cori
//:: Created On:  Nov 2003
//:://////////////////////////////////////////////
#include "os_inc_banter"

int StartingConditional()
{
    if (TryBanterWith("os_hen_kai", 2) == TRUE)
    {
        return TRUE;
    }
    return FALSE;


}
