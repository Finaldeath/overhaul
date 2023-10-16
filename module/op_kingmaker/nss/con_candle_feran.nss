//::///////////////////////////////////////////////
//:: con_candle_feran.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Returns TRUE if the player has resolved the
    Feran / Ellysia plot and gotten the two of
    them back together.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: June 9, 2004
//:://////////////////////////////////////////////

int StartingConditional()
{
    int iFeranPlot = GetLocalInt(GetModule(), "OS_FERANLOVE");
    if (iFeranPlot == 60)
    {
        return TRUE;
    }
    return FALSE;
}
