int StartingConditional()
{
    int l_iResult;

    l_iResult = (GetAbilityScore(GetLastSpeaker(),ABILITY_CHARISMA) > 13) && (GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) > 8);
    return l_iResult;
}
