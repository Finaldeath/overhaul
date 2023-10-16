// chance of swiping the wine

int StartingConditional()
{
    int nDex;
    int nChance;
    int nSkill = GetSkillRank(SKILL_PICK_POCKET, GetPCSpeaker());
    if (nSkill > 0)
    {
        nChance = (nSkill * 10);
        nDex = GetAbilityScore(GetPCSpeaker(), ABILITY_DEXTERITY);

        if (nChance < (nDex * 3))
        {
            nChance = (nDex * 3);
        }

        if (d100() < nChance)
        {
            return TRUE;
        }
    }
    if (nSkill == 0)
    {
        nChance = (GetAbilityScore(GetPCSpeaker(), ABILITY_DEXTERITY) * 3);
        if (d100() < nChance)
        {
            return TRUE;
        }
    }
    return FALSE;
}
