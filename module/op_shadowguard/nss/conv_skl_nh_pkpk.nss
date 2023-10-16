#include "help_skills"

int StartingConditional()
{
    if (GetSkillRank(SKILL_PICK_POCKET, GetPCSpeaker()) == 0)
        return TRUE;

    return FALSE;
}
