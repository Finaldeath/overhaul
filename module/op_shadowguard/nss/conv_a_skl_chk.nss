#include "help_skills"

int StartingConditional()
{
    object o = GetPCSpeaker();      // The object making the skill check
    int nSkill = SKILL_ALL_SKILLS;  // The skill to check
    int nDC = 20;                   // The DC to beat

    return SkillCheck(o, nSkill, nDC);
}
