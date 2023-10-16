// returns TRUE for pc with animal empathy skill

int StartingConditional()
{
    return GetHasSkill(SKILL_ANIMAL_EMPATHY, GetPCSpeaker());
}
