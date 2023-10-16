// * The first time someone enters the area, spawn the Grasstiles
void main()
{
    if (GetLocalInt(OBJECT_SELF, "NW_L_FLOOD") == 0)
    {
        //First time in - paint in the grass and apply effects to the reaper doors
        ExecuteScript("util_floodgrass", OBJECT_SELF);
        SetLocalInt(OBJECT_SELF, "NW_L_FLOOD", 10);
        int nCount;
        object oDoor;
        for (nCount = 0; nCount < 6; nCount++)
        {
            oDoor = GetObjectByTag("x2_reapdoor" + IntToString(nCount));
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oDoor);
        }

    }
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC))
    {
        //These should only both be set to 0 when the last player has left the area - or the
        //very first player enters - so it should be safe to spawn creatures in here- the first time.
        if (GetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT") == 0 && GetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT") == 0)
        {
            SetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT", 1);//good MOB
            SetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT", 1);//evil MOB

            //Create Deer/Bear/Wolves
            CreateObject(OBJECT_TYPE_CREATURE, "q2ebear", GetLocation(GetWaypointByTag("q2e_bearspn_1")));
            //CreateObject(OBJECT_TYPE_CREATURE, "q2ebear", GetLocation(GetWaypointByTag("q2e_bearspn_2")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2ewolf", GetLocation(GetWaypointByTag("q2e_wolfspn_1")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2ewolf", GetLocation(GetWaypointByTag("q2e_wolfspn_2")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2ewolf", GetLocation(GetWaypointByTag("q2e_wolfspn_3")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2e_deerspn_1")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2e_deerspn_2")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2e_deerspn_3")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2e_deerspn_4")));
            CreateObject(OBJECT_TYPE_CREATURE, "q2edeer", GetLocation(GetWaypointByTag("q2e_deerspn_5")));
        }
    }
}
