int SkillCheck(object o, int nSkill, int nDC)
{
    int n;

    if (GetIsInCombat(o))
        n = d20(); // Random roll if caller in combat

    else
        n = 20; // Else, can Take 20

    if (n + GetSkillRank(nSkill, o) >= nDC)
        return TRUE;

    return FALSE;
}
