//::///////////////////////////////////////////////
//:: Death
//:: m2q3CharComHou_B
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     When a charwood commoner dies, they spawn in
     from a doorway and walk back to their spot.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 29, 2001
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetObjectByTag("WP_M2Q3COMSP06");
//    object oDoor = GetObjectByTag("M2Q3GE_M2Q3GA");

    SetLocalLocation(GetArea(OBJECT_SELF),"NW_A_CommonerSpot",GetLocation(OBJECT_SELF));
//    AssignCommand(oDoor,ActionOpenDoor(OBJECT_SELF));
//    AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF)));
    CreateObject(OBJECT_TYPE_CREATURE,GetTag(OBJECT_SELF),GetLocation(oWaypoint));
}
