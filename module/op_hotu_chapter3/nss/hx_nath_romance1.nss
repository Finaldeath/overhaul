//::///////////////////////////////////////////////
//:: Name hx_nath_romance1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Romance with Nathyrra.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Oct 23, 2003
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iRomance = GetLocalInt(GetModule(), "iNathyrraRomance");

    if(iRomance > 0)
    {
        return TRUE;
    }
    return FALSE;
}

