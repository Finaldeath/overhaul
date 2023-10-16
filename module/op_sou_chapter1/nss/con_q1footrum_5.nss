int StartingConditional()
{
    int nRoll = d100();
    if (nRoll < (25 + GetAbilityScore(GetPCSpeaker(), ABILITY_CONSTITUTION)))
        return TRUE;
    return FALSE;
}
