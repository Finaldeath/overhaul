#include "help_skills"

int StartingConditional()
{
    object o = GetPCSpeaker();      // The object making the skill check
    int nSkill = SKILL_DISABLE_TRAP;  // The skill to check
    int nDC = 30;                   // The DC to beat

    return SkillCheck(o, nSkill, nDC);
}
