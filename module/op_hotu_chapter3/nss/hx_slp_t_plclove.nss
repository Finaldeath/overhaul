//::///////////////////////////////////////////////
//:: Name hx_slp_t_plclove
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Thinks Places is his love.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////
int StartingConditional()
{

    if(GetLocalString(GetModule(), "sSleepingManThinksLoveIs") == "Places")
    {
        return TRUE;
    }
    return FALSE;
}


