//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #14
//:: LordIridor14.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if Morgroth's Heart has already
    been returned to Lord Iridor.
*/
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iMainPlot = GetLocalInt(GetModule(), "MainPlot");

    if (iMainPlot == 3)
    {
        return TRUE;
    }
    return FALSE;
}
