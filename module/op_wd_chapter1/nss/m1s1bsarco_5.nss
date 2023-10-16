void main()
{
    effect eDeath = EffectDeath(FALSE,FALSE);
    if ( GetTag(GetInventoryDisturbItem()) == "M1S1Tyr" &&
         GetLocalInt(OBJECT_SELF,"NW_L_M1S2BSymbolTaken") == FALSE)
    {
        SetLocalInt(OBJECT_SELF,"NW_L_M1S2BSymbolTaken",TRUE);
        int nNth = 1;
        object oEncounter = GetNearestObjectByTag("M1S1_AllUndead",OBJECT_SELF,nNth);
        while(GetIsObjectValid(oEncounter))
        {
            SetEncounterActive(TRUE,oEncounter);
            nNth++;
            oEncounter = GetNearestObjectByTag("M1S1_AllUndead",OBJECT_SELF,nNth);
        }
        nNth = 1;
        object oDoor = GetNearestObjectByTag("M1S1BDoor",OBJECT_SELF,nNth);
        while (GetIsObjectValid(oDoor))
        {
            SetPlotFlag(oDoor,FALSE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oDoor);
            nNth++;
            oDoor = GetNearestObjectByTag("M1S1BDoor",OBJECT_SELF,nNth);
        }
    }
}
