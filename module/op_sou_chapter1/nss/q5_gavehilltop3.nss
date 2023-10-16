// Tymofarrar has not already agreed to leave Hilltop alone
// and the PC has a Wisdom of 14 or more

int StartingConditional()
{
    int iResult;

    iResult = ((GetLocalInt(OBJECT_SELF, "q5_Gave_Hilltop") == 0) &&
              (GetAbilityScore(GetPCSpeaker(), ABILITY_WISDOM) > 13));
    return iResult;
}
