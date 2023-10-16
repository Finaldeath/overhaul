//::///////////////////////////////////////////////
//:: Heartbeat
//:: M2Q5F_SERGEANT
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Spawns the Luskan sergeant at the gate.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 13, 2002
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(GetModule(),"Luskan_Gate_Open") == 1 &&
        GetLocalInt(OBJECT_SELF,"NW_Spawn_Sergeant") == 0)
    {
        CreateObject(OBJECT_TYPE_CREATURE,"M2Q05CLUSKANSERG",GetLocation(GetWaypointByTag("WP_LUSKAN_SERGEANT")));
        SetLocalInt(OBJECT_SELF,"NW_Spawn_Sergeant",1);
    }
}
