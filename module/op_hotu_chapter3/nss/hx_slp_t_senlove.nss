//::///////////////////////////////////////////////
//:: Name hx_slp_t_senlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks Sensei is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "Sensei")
    {
        return TRUE;
    }
    return FALSE;
}


