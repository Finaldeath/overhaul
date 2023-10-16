//::///////////////////////////////////////////////
//:: Name hx_slp_t_arilove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks Aribeth is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "Aribeth")
    {
        return TRUE;
    }
    return FALSE;
}


