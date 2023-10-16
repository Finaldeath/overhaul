#include "help_skills"

int StartingConditional()
{
    object o = GetPCSpeaker();      // The object making the skill check
    int nSkill = SKILL_SPOT;  // The skill to check
    int nDC = 22;                   // The DC to beat

    return SkillCheck(o, nSkill, nDC);
}
