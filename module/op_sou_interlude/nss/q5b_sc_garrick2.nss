// garrick is healed

int StartingConditional()
{
    object oGarrick = GetNearestObjectByTag("Q5B_GARRICK");
    return GetCurrentHitPoints(oGarrick) == GetMaxHitPoints(oGarrick);
}
