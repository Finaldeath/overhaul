int StartingConditional()
{
    int nClass = GetLevelByClass(CLASS_TYPE_PALADIN, GetPCSpeaker());
    int nGood = GetAlignmentGoodEvil(GetPCSpeaker());
    int nLawful = GetAlignmentLawChaos(GetPCSpeaker());
    if ((nClass > 0) || ((nGood == ALIGNMENT_GOOD) && (nLawful == ALIGNMENT_LAWFUL)))
    {
        return TRUE;
    }
    return FALSE;
}
