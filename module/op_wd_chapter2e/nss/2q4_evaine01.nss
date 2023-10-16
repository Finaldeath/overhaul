int StartingConditional()
{
    object oRing = GetItemPossessedBy(GetPCSpeaker(),"Elynwyd_Ring");
    int iPlot = GetLocalInt(GetPCSpeaker(),"Evaine_Plot_Explained");
    if (GetIsObjectValid(oRing) || (iPlot == 1))
    {
        return TRUE;
    }
    return FALSE;
}
