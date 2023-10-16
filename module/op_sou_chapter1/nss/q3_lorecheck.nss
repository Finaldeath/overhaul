// the PC has a Lore value of 1 or higher
// or has successfully checked this out before

int StartingConditional()
{
    int nLore = GetSkillRank(SKILL_LORE, GetPCSpeaker());
    int nTry = GetLocalInt(GetPCSpeaker(), "q3_Translation_Attempt");

    if ((nTry == 1) || ((nLore > 0) && (nTry == 0)))
    {
        return TRUE;
    }
    return FALSE;
}
