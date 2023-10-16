//::///////////////////////////////////////////////
//:: Name q4a4_light_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script closes the lightning door, fixing
     the bug where it isn't closed when it should
     be.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 15, 2003
//:://////////////////////////////////////////////

void main()
{
   object oDoor = GetObjectByTag("puzzle_door");

   AssignCommand(oDoor, ActionCloseDoor(OBJECT_SELF));
   DestroyObject(OBJECT_SELF);
}
