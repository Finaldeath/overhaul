//::///////////////////////////////////////////////
//:: Name hx_slp_plcchk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Knower of Places check on leaving.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_PLACES_LEFT") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
