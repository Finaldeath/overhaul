// if a chicken has not already told about the trough

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q1b_trough");
    int nClass1 = GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker());
    if ((nPlot == 0) && ((nClass1 > 0) || (nClass2 > 0)))
    {
        return TRUE;
    }
    return FALSE;
}
