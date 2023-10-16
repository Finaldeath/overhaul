void main()
{
        object oPC = GetPCSpeaker();
        object oRing;
        
        if(GetLocalInt(GetModule(),"M2Q2_DRUIDARENA4") == 20)
            {
            SetLocalInt(GetModule(),"M2Q2_DRUIDARENA4",0);
            }
            
        if(GetLocalInt(GetModule(),"M2Q2_DRUIDARENA3") == 20)
            {
            oRing = GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID4");
            DestroyObject(oRing);
            SetLocalInt(GetModule(),"M2Q2_DRUIDARENA3",0);
            }
        if(GetLocalInt(GetModule(),"M2Q2_DRUIDARENA2") == 20)
            {
            oRing = GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID3");
            DestroyObject(oRing);
            SetLocalInt(GetModule(),"M2Q2_DRUIDARENA2",0);
            }
        if(GetLocalInt(GetModule(),"M2Q2_DRUIDARENA1") == 20)
            {
            oRing = GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID2");
            DestroyObject(oRing);
            SetLocalInt(GetModule(),"M2Q2_DRUIDARENA1",0);
            }
        if(GetLocalInt(GetModule(),"M2Q2_DRUIDARENA") == 20)
            {
            oRing = GetItemPossessedBy(oPC,"M2Q2ITRINGDRUID1");
            DestroyObject(oRing);
            SetLocalInt(GetModule(),"M2Q2_DRUIDARENA",0);
            }
        AssignCommand(oPC,ActionJumpToObject(GetWaypointByTag("WP_M2Q2EDruidCamp")));
}
