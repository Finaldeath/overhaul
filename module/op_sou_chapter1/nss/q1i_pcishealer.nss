// checks to see if the PC is a cleric
// or has CureLightWounds memorized
// or has 4+ levels of Heal skill

int StartingConditional()
{
    int nClass = GetLevelByClass(CLASS_TYPE_CLERIC, GetPCSpeaker());
    int nHeal = GetSkillRank(SKILL_HEAL, GetPCSpeaker());

    if ((nClass > 0) || (nHeal > 3) ||
       (GetHasSpell(SPELL_CURE_LIGHT_WOUNDS, GetPCSpeaker())))
    {
        return TRUE;
    }
    return FALSE;
}
