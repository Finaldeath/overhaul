// NW_D2_WISN
//
// Wisdom of PC 12+

int StartingConditional()
{
    int iResult;

    iResult = GetAbilityScore(GetPCSpeaker(), ABILITY_WISDOM) > 11;
    return iResult;
}
