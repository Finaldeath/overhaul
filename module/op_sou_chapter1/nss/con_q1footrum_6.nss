int StartingConditional()
{
    int nRoll = d100();
    int nDex = GetAbilityScore(GetPCSpeaker(), ABILITY_DEXTERITY);
    int nChar = GetAbilityScore(GetPCSpeaker(), ABILITY_CHARISMA);
    int nAbility = nChar;
    if (nDex > nChar)
        nAbility = nDex;
    if (nRoll < (60 + nAbility))
        return TRUE;
    return FALSE;
}
