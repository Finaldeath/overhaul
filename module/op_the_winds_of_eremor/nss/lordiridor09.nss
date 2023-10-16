//::///////////////////////////////////////////////
//:: Name
//:: FileName
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE once somebody has accepted the
    quest.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot > 0)
    {
        return TRUE;
    }
    return FALSE;
}
