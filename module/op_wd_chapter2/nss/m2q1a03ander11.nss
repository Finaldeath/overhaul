int StartingConditional()
{
    int iPlot = GetLocalInt(OBJECT_SELF, "ANDER_KNOW_ALHELOR");
    object oPlot = GetLocalObject(OBJECT_SELF, "PCHunter");
    if ((iPlot == 1) && (oPlot == GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
