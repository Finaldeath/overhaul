int StartingConditional()
{
    int l_iResult;

    l_iResult = (GetAbilityScore(GetLastSpeaker(),ABILITY_WISDOM) > 13) && (GetAbilityScore(GetLastSpeaker(),ABILITY_INTELLIGENCE) < 9);
    return l_iResult;
}
