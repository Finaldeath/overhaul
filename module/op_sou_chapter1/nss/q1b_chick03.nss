// the PC is a ranger or druid
// 50% chance of falling through

int StartingConditional()
{
    int nClass1 = GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker());
    int nRoll = d100();

    if ((nClass1 > 0) || (nClass2 > 0))
    {
        if (nRoll > 50)
        {
            return TRUE;
        }
    }
    return FALSE;
}
