int StartingConditional()
{
    int iResult;

    iResult = GetAbilityScore(GetPCSpeaker(),ABILITY_CONSTITUTION) < 16;
    return iResult;
}
