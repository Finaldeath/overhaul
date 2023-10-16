//::///////////////////////////////////////////////
//:: Name hx_slp_t_natlove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks Nathyrra is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "Nathyrra")
    {
        return TRUE;
    }
    return FALSE;
}


