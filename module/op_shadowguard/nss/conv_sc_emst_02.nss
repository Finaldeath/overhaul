#include "help_hench"
#include "help_skills"

int StartingConditional()
{
    if (GetTag(OBJECT_SELF) != "PLAC_ST_1_RAK_STAT")
        return FALSE;

    if (GetJournalQuestState("JT_ST_1_MAIN", GetPCSpeaker()) >= 6)
        return FALSE;

    if (GetSkillRank(SKILL_SPELLCRAFT, GetPCSpeaker()) == 0)
        return FALSE;

    return TRUE;

}
