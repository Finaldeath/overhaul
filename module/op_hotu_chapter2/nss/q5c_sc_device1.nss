// Skill check for ancient device (can be Lore or Spellcraft)

int StartingConditional()
{
    int nDC = GetLocalInt(OBJECT_SELF, "DC");
    int nSkill = GetLocalInt(OBJECT_SELF, "SKILL");

    return GetIsSkillSuccessful(GetPCSpeaker(), nSkill, nDC);

}
