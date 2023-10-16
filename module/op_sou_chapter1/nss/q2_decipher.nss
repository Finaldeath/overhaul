// check to see if the PC is a rogue or bard

int StartingConditional()
{
    int nClass1 = GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());

    if ((nClass1 > 0) || (nClass2 > 0))
    {
        return TRUE;
    }
    return FALSE;
}
