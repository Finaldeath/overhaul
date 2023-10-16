//::///////////////////////////////////////////////
//:: Name hx_slp_x_trulovex
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Doesn't know his one true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "")
    {
        return TRUE;
    }
    return FALSE;
}


