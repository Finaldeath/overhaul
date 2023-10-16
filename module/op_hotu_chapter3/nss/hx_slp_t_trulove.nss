//::///////////////////////////////////////////////
//:: Name hx_slp_t_trulove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks he knows his one
     true love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{
    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") != "")
    {
        return TRUE;
    }
    return FALSE;
}


