// if Kendrack plot not completed

int StartingConditional()
{
    object oMayor = GetObjectByTag("M2Q1CHAEROM");
    int iPlot = GetLocalInt(oMayor, "NW_KENDRACK_PLOT");
    if (iPlot < 3)
    {
        return TRUE;
    }
    return FALSE;
}
