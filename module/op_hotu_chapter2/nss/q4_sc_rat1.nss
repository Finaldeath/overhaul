// returns TRUE for pc with animal empathy skill AND the jail door is open

int StartingConditional()
{
    object oDoor = GetNearestObjectByTag("q4c_jail_door");
    return GetIsOpen(oDoor) && GetHasSkill(SKILL_ANIMAL_EMPATHY, GetPCSpeaker());
}
