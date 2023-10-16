//Check to see if the PC has a perform skill of 2 or more...
int StartingConditional()
{
    if (GetLevelByClass(CLASS_TYPE_BARD, GetPCSpeaker()) > 0)
    {
        if (GetHasSkill(SKILL_PERFORM, GetPCSpeaker()) == TRUE)
        {
            if (GetSkillRank(SKILL_PERFORM, GetPCSpeaker()) > 1)
            {
                return TRUE;
            }
        }
     }
    return FALSE;
}
