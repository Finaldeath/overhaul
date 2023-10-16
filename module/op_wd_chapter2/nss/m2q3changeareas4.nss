void main()
{
    string sResolution = GetLocalString(GetModule(), "m2q3_Resolution");
    object oTarget, oArea, oWaypoint;
    location lLocation;
    vector vPosition;
    float fFacing;


    if (GetLocalInt(OBJECT_SELF,"NW_A_ChangeArea") == 0 &&
        GetUserDefinedEventNumber() == 300)
    {
        if (sResolution == "Quint" || sResolution == "Player")
        {
            oArea = GetObjectByTag("M2Q3GCHARWOOD2");
            oWaypoint = GetWaypointByTag("WP_M2Q3GE" + "Q");
        }

        if (sResolution == "Karlat")
        {
            oArea = GetObjectByTag("M2Q3GCHARWOOD3");
            oWaypoint = GetWaypointByTag("WP_M2Q3GE" + "K");
        }

        oTarget = GetFirstObjectInArea();

        while (GetIsObjectValid(oTarget))
        {
            if (GetIsPC(oTarget))
            {
                lLocation = GetLocation(oWaypoint);
                vPosition = GetPositionFromLocation(lLocation);
                fFacing = GetFacingFromLocation(lLocation);
                lLocation = Location(oArea,vPosition,fFacing);

                AssignCommand(oTarget,JumpToLocation(lLocation));
            }
            oTarget = GetNextObjectInArea();
        }

        SetLocalInt(OBJECT_SELF,"NW_A_ChangeArea",10);
    }
}
