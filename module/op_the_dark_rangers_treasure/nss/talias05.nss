//::///////////////////////////////////////////////
//:: Talias Conversation Script #5
//:: talias05
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has left the
    Ruins area (MainPlot = 2).
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot == 2)
    {
        return TRUE;
    }
    return FALSE;
}
