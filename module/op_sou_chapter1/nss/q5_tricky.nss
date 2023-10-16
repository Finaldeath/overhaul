// checks to see if the PC is a rogue or bard
// or has an Intelligence or Wisdom of 15+

int StartingConditional()
{
    int nClass1 = GetLevelByClass(CLASS_TYPE_ROGUE, GetPCSpeaker());
    int nClass2 = GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker());
    int nInt = GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE);
    int nWis = GetAbilityScore(GetPCSpeaker(), ABILITY_WISDOM);

    if ((nClass1 > 0) || (nClass2 > 0))
    {
        return TRUE;
    }
    else if ((nInt > 14) || (nWis > 14))
    {
        return TRUE;
    }
    return FALSE;
}
