void main()
{
    switch (GetUserDefinedEventNumber())
    {
        case 1003:
        {
            int nCount = GetLocalInt(OBJECT_SELF,"NW_L_Count");

            if (nCount >= 0 && nCount < 3)
            {
                if (nCount == 0)
                {
                    SpeakOneLinerConversation();
                }
                nCount++;
            }
            else
            {
                nCount = 0;
            }
            SetLocalInt(OBJECT_SELF,"NW_L_Count",nCount);
        }
        break;
        case 1007:
        {
            object oAttacker = GetLastKiller();
            object oMaster = GetMaster(oAttacker);
            if(GetIsObjectValid(oMaster))
            {
                oAttacker = oMaster;
            }
            SetLocalInt(GetModule(),"NW_G_M1Q5MainPlot",100);
            SetLocalObject(GetModule(),"NW_G_M1Q5Hero",oAttacker);
            SetCustomToken(11,GetName(oAttacker));

            int nNth = 0;
            object oEnc = GetObjectByTag("ENC_M1Q5",nNth);
            while(GetIsObjectValid(oEnc))
            {
                SetEncounterActive(FALSE,oEnc);
                nNth++;
                oEnc = GetObjectByTag("ENC_M1Q5",nNth);
            }

            nNth = 1;
            object oZombie = GetNearestObjectByTag("M1Q5E01ZOMBIE",OBJECT_SELF,nNth);
            while(GetIsObjectValid(oZombie))
            {
                DestroyObject(oZombie);
                nNth++;
                oZombie = GetNearestObjectByTag("M1Q5E01ZOMBIE",OBJECT_SELF,nNth);
            }

            nNth = 0;
            object oBarricade = GetObjectByTag("M1Q5Barricade",nNth);
            while(GetIsObjectValid(oBarricade))
            {
                DestroyObject(oBarricade);
                nNth++;
                oBarricade = GetObjectByTag("M1Q5Barricade",nNth);
            }

            object oDoor = GetObjectByTag("M1Q5A_M1Q5F");
            AssignCommand(oDoor,ActionOpenDoor(oDoor));
            oDoor = GetObjectByTag("M1Q5F_M1Q5A");
            AssignCommand(oDoor,ActionOpenDoor(oDoor));
            effect eDeath = EffectDeath(FALSE,FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,GetNearestObjectByTag("M1Q5EAltar"));

            SignalEvent(GetObjectByTag("KRESTAL_LOWER"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("JEMANIE_LOWER"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("MAP_M1Q5M"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("MAP_M1Q5N"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("MAP_M1Q5O"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("MAP_M1Q5P"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("Map_M1Q5A"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("MAP_M1Q5G1"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("Graveyard"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("Map_M1Q5R"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("WAREHOUSE"),EventUserDefined(599));
            SignalEvent(GetObjectByTag("KRESTAL_UPPER"),EventUserDefined(599));
        }

    }
}
