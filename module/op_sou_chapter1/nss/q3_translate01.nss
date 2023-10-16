// does a lore check to translate

int StartingConditional()
{
    int iResult;

    iResult = GetIsSkillSuccessful(GetPCSpeaker(), SKILL_LORE, 10);
    return iResult;
}
