//::///////////////////////////////////////////////
//:: Death
//:: m2q3CharCom_B
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
    int nRand = Random(3);
    object oWaypoint, oDoor;

    switch (nRand)
    {
        case 0:
            oWaypoint = GetObjectByTag("WP_M2Q3COMSP01");
            oDoor = OBJECT_INVALID;
        break;
        case 1:
            oWaypoint = GetObjectByTag("WP_M2Q3COMSP02");
            oDoor = GetObjectByTag("M2Q3GA_M2Q3GC");
        break;
        case 2:
            oWaypoint = GetObjectByTag("WP_M2Q3COMSP03");
            oDoor = GetObjectByTag("M2Q3GA_M2Q3GD");
        break;
    }

    SetLocalLocation(GetArea(OBJECT_SELF),"NW_A_CommonerSpot",GetLocation(OBJECT_SELF));
    AssignCommand(oDoor,ActionOpenDoor(OBJECT_SELF));
    AssignCommand(oDoor,DelayCommand(2.0,ActionCloseDoor(OBJECT_SELF)));
    CreateObject(OBJECT_TYPE_CREATURE,GetTag(OBJECT_SELF),GetLocation(oWaypoint));
}
