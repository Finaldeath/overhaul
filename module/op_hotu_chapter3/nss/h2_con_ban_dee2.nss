//::///////////////////////////////////////////////
//:: x2_con_ban_dee2
//:: Copyright (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Try to start a conversation with Deekin.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:  August 2003
//:://////////////////////////////////////////////
#include "x2_inc_banter"

int StartingConditional()
{
    if (TryBanterWith("x2_hen_deekin", 2    ) == TRUE)
    {
        if(GetAlignmentGoodEvil(OBJECT_SELF) == ALIGNMENT_EVIL)
        {
            return TRUE;
        }
    }
    return FALSE;


}
