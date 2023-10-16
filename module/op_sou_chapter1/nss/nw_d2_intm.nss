// the PC has a mid-range Intelligence (Int 9-14)

int StartingConditional()
{
    int iResult;

    iResult = ((GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) > 8) &&
               (GetAbilityScore(GetPCSpeaker(), ABILITY_INTELLIGENCE) < 15));
    return iResult;
}
