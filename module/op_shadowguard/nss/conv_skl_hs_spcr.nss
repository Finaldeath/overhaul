#include "help_skills"

int StartingConditional()
{
    if (GetSkillRank(SKILL_SPELLCRAFT, GetPCSpeaker()) == 0)
        return FALSE;

    return TRUE;
}
