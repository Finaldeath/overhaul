//::///////////////////////////////////////////////
//:: Entered
//:: NW_PW_Entered
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: March 5, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);
    object oWaypoint = GetNearestObjectByTag("WP_PEASANT_EXIT");

    if (!GetIsObjectValid(GetLocalObject(OBJECT_SELF,"NW_L_PEASANT")))
    {
        SetLocalObject(OBJECT_SELF,"NW_L_PEASANT",CreateObject(OBJECT_TYPE_CREATURE,"NW_PEASANT",GetLocation(oWaypoint)));
        ActionOpenDoor(oDoor);
        AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF)));
    }
}
