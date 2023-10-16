int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "q3_Glendir_Lie") == 1;
    object oNote = GetItemPossessedBy(OBJECT_SELF, "q3_promissary");

    if ((nPlot == 1) && GetIsObjectValid(oNote))
    {
        return TRUE;
    }
    return FALSE;
}
