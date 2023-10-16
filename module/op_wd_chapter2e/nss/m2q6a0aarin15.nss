int StartingConditional()
{
    object oPlot = GetItemPossessedBy(GetPCSpeaker(), "AARIN_AMULET");
    if (GetIsObjectValid(oPlot))
    {
        return TRUE;
    }
    return FALSE;
}
