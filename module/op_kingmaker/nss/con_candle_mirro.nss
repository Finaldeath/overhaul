//::///////////////////////////////////////////////
//:: con_candle_mirro.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has resolved the
    Feran / Ellysia plot and gotten the two of
    them back together. The player has not yet
    received Lady Rehan's mirror.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iFeranPlot = GetLocalInt(GetModule(), "OS_FERANLOVE");
    int iMirror = GetLocalInt(OBJECT_SELF, "bGaveMirrorToPC");
    if (iFeranPlot == 60 &&
        iMirror == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
