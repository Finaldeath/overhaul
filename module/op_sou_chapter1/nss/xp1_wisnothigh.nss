// Wisdom is less than 15

int StartingConditional()
{
    int iResult;

    iResult = GetAbilityScore(GetPCSpeaker(), ABILITY_WISDOM) < 15;
    return iResult;
}
