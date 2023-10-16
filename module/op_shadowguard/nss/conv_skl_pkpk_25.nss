#include "help_skills"

int StartingConditional()
{
    object o = GetPCSpeaker();      // The object making the skill check
    int nSkill = SKILL_PICK_POCKET;  // The skill to check
    int nDC = 25;                   // The DC to beat

    return SkillCheck(o, nSkill, nDC);
}
