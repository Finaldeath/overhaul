//con_q2dslaveld_2
//Only return true after the slave revolt has spawned in
int StartingConditional()
{
    object oTarget = GetWaypointByTag("mn_stairstoentrance");
    object oArea = GetArea(oTarget);

    if (GetLocalInt(oArea, "nRevolt") == 1)
        return TRUE;
    return FALSE;
}
