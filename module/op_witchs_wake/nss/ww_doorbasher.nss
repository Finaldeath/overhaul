//::///////////////////////////////////////////////
//:: Witchwork: Door Basher
//:: WW_DoorBasher.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Bashes the nearest door, then destroys
     itself
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: November 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

    //Destroy door.
    DestroyObject(oDoor);

    //Destroy self now that the door is gone.
    DestroyObject(OBJECT_SELF, 1.0);
}
