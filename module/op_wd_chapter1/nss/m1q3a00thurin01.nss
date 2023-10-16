int StartingConditional()
{
    int iAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    int iChar = GetAbilityScore(GetPCSpeaker(),ABILITY_CHARISMA);
    if ((iAlign = ALIGNMENT_EVIL) || (iChar < 9))
    {
        return TRUE;
    }
    return FALSE;
}
