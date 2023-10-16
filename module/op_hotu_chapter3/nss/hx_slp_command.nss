//::///////////////////////////////////////////////
//:: Name hx_slp_command
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     PC commanded her to go to Sleeping Man.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    if(GetLocalInt(GetModule(), "bNamesGoToSleepingMan") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
