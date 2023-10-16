void main()
{
    int nNth = 1;
    object oDoor = GetNearestObjectByTag("M1S2EGuardDoor",OBJECT_SELF,nNth);
    while(GetIsObjectValid(oDoor))
    {
        AssignCommand(oDoor,ActionOpenDoor(oDoor));
        nNth++;
        oDoor = GetNearestObjectByTag("M1S2EGuardDoor",OBJECT_SELF,nNth);
    }
    nNth = 1;
    object oEncounter = GetNearestObjectByTag("ENC_M1S2EGuards",OBJECT_SELF,nNth);
    while(GetIsObjectValid(oEncounter))
    {
        SetEncounterActive(TRUE,oEncounter);
        nNth++;
        oEncounter = GetNearestObjectByTag("ENC_M1S2EGuards",OBJECT_SELF,nNth);
    }
}
