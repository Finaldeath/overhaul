void main()
{
    int nFlee = GetLocalInt(GetModule(), "NW_M3Q3_ORCS_FLEE");
    object oWayFlee = GetWaypointByTag("NW_M3_Q3_WAY_FLEE");
    if(nFlee == 4)
    {
        ClearAllActions();
        ActionMoveToObject(oWayFlee, TRUE);
        nFlee++;
    }
    else if (nFlee < 4)
    {
        nFlee++;
        SetLocalInt(GetModule(), "NW_M3Q3_ORCS_FLEE", nFlee);
    }
}
