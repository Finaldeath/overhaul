void main()
{
  //location lLoc = GetLocation(GetWaypointByTag("WP_M1Q1APyre"));
  int nEvent = GetUserDefinedEventNumber();
  switch (nEvent)
  {
   // guard spawns
     case 114:
     if(!GetIsObjectValid(GetLocalObject(OBJECT_SELF,"M1Q1APyreGuard")))
     {
        object oPyreGuard = CreateObject( OBJECT_TYPE_CREATURE,
                                   "M1Q1APYRE",
                                   GetLocation(GetWaypointByTag("WP_PyreStart")) );
        SetLocalObject(OBJECT_SELF,"M1Q1APyreGuard",oPyreGuard);
        SignalEvent(oPyreGuard,EventUserDefined(115));
     }
     break;
     case 116:
     {
         object oBody = CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_CORPSE1",GetLocation(GetWaypointByTag("WP_M1Q1ABody")));
         SetLocalObject(OBJECT_SELF,"M1Q1ACorpse",oBody);
     }
     break;
     case 117:
     {
         object oFire = CreateObject(OBJECT_TYPE_PLACEABLE,"PLC_FLAMEMEDIUM",GetLocation(GetWaypointByTag("WP_M1Q1ABody")));
         DestroyObject(GetLocalObject(OBJECT_SELF,"M1Q1ACorpse"),7.0);
         DestroyObject(oFire,8.0);
     }
     break;
     case 625:
     {
         int nNth = 0;
         object oWP = GetObjectByTag("WP_M1S2Closed",nNth);
         while(GetIsObjectValid(oWP))
         {
            CreateObject(OBJECT_TYPE_PLACEABLE,"M1S2CLOSED_SIGN",GetLocation(oWP));
            nNth++;
            oWP = GetObjectByTag("WP_M1S2Closed",nNth);
         }
         string sNum;
         object oDoor;
         for(nNth = 1;nNth <=3;nNth++)
         {
            sNum = IntToString(nNth);
            oDoor = GetObjectByTag("M1Q1A" + sNum + "_" + "M1S2A" + sNum);
            AssignCommand(oDoor,ActionCloseDoor(oDoor));
            SetLocked(oDoor,TRUE);
         }
     }
     break;
  }
}

