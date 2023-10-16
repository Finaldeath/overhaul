//::///////////////////////////////////////////////
//:: Name hx_slp_t_pclove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks PC is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "Player")
    {
        return TRUE;
    }
    return FALSE;
}


