// slave is still in cage
// not the first time he is spoken to

int StartingConditional()
{
    object oCage = GetObjectByTag("Q3_CAGEDOOR");
    int nPlot = GetLocalInt(GetPCSpeaker(), "q3_Talked_To_Glendir");

    if (GetIsOpen(oCage) == FALSE && (nPlot != 0))
    {
        return TRUE;
    }
    return FALSE;
}
