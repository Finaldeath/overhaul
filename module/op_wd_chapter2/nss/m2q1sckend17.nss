// once the mayor has collected three ears and the player has the fourth

int StartingConditional()
{
    int iPlot2 = GetLocalInt(OBJECT_SELF,"NW_KENDRACK_PLOT");
    if (iPlot2 == 1 &&
        GetLocalInt(GetModule(),"NW_G_TookZorEar") == 10 &&
        GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 10 &&
        GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 10 &&
        GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 10)
    {
        return TRUE;
    }
    return FALSE;
}
