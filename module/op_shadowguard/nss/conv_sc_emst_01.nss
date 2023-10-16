#include "help_hench"
#include "help_skills"

int StartingConditional()
{
    if (GetTag(OBJECT_SELF) != "PLAC_ST_1_RAK_STAT")
        return FALSE;

    if (GetJournalQuestState("JT_ST_1_MAIN", GetPCSpeaker()) >= 6)
        return FALSE;

    if (!(SkillCheck(GetPCSpeaker(), SKILL_SPOT, 25)))
        return FALSE;

    return TRUE;

}
