void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && GetLocalInt(OBJECT_SELF,"NW_L_TriggerFired") == FALSE)
    {
        int nIdx;
        location lLoc;
        SetLocalInt(OBJECT_SELF,"NW_L_TriggerFired",TRUE);
        for (nIdx = 1; nIdx < 5; nIdx++)
        {
            lLoc = GetLocation(GetNearestObjectByTag("WP_M1Q2ANewSpawn" + IntToString(nIdx)));
            CreateObject(OBJECT_TYPE_CREATURE,"M1Q2TRIGEP",lLoc);
        }
    }
}
