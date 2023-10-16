void main()
{
    string sResolution = GetLocalString(GetModule(), "m2q3_Resolution");
    object oTarget, oArea;
    location lLocation;
    vector vPosition;
    float fFacing;


    if (GetLocalInt(OBJECT_SELF,"NW_A_ChangeArea") == 0 &&
        GetUserDefinedEventNumber() == 300)
    {
        if (sResolution == "Quint" || sResolution == "Player")
        {
            oArea = GetObjectByTag("M2Q3GCHARWOOD2");
        }

        if (sResolution == "Karlat")
        {
            oArea = GetObjectByTag("M2Q3GCHARWOOD3");
        }

        oTarget = GetFirstObjectInArea();

        while (GetIsObjectValid(oTarget))
        {
            if (GetIsPC(oTarget))
            {
                lLocation = GetLocation(oTarget);
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
