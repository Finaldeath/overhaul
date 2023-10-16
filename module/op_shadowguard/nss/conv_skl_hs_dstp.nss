#include "help_skills"

int StartingConditional()
{
    if (GetSkillRank(SKILL_DISABLE_TRAP, GetPCSpeaker()) == 0)
        return FALSE;

    return TRUE;
}
