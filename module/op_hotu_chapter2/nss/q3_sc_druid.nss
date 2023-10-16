// returns TRUE for a pc with animal empathy

int StartingConditional()
{
    return GetHasSkill(SKILL_ANIMAL_EMPATHY, GetPCSpeaker());
}
