//::///////////////////////////////////////////////
//:: Perin Conversation Script #2
//:: Perin02
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns true if the player has already taken
    on Perin as a henchman ("MainPlot" local > 0).
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
