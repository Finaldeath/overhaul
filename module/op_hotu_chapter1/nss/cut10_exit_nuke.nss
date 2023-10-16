//::///////////////////////////////////////////////
//:: Name cut10_exit_nuke
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sobrey cutscene OnExit nuke.

    This script will run through all objects in
    the area and destroy all unwanted ones. These
    include creatures and destroyed objects that
    have been spawned in.  The purpose is so that
    the cutscene is repeatable.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 12, 2002
//:://////////////////////////////////////////////
void main()
{
     object oArea = GetArea(OBJECT_SELF);
     object oObject = GetFirstObjectInArea(oArea);
     // The doors in the cutscene.
     object oDoor1 = GetObjectByTag("cut10_door1");
     object oDoor2 = GetObjectByTag("cut10_door2");

     while(oObject != OBJECT_INVALID) {
          if(GetIsPC(oObject) == FALSE) {
               // Filter out the stuff we don't want to destroy
               if(GetObjectType(oObject) == OBJECT_TYPE_PLACEABLE) {
                    // Placeables we WANT to destroy
                    if(GetTag(oObject) == "cut10_barrel1" || GetTag(oObject) == "cut10_barrel1_b"
                       || GetTag(oObject) == "cut10_barrel2" || GetTag(oObject) == "cut10_barrel2_b"
                       || GetTag(oObject) == "cut10_statue1" || GetTag(oObject) == "cut10_statue1_b"
                       || GetTag(oObject) == "cut10_cart" || GetTag(oObject) == "cut10_cart_b"
                       || GetTag(oObject) == "cut10_flame1" || GetTag(oObject) == "cut10_flame2")
                    DestroyObject(oObject);
               }
               if(GetObjectType(oObject) == OBJECT_TYPE_CREATURE && GetMaster(oObject) == OBJECT_INVALID) {
                     // Creatures we DON'T want to destroy
                    if(GetTag(oObject) != "cut10_drow_wiz1" && GetTag(oObject) != "cut10_drow_wiz2"
                       && GetTag(oObject) != "cut10_drow_wiz3" && GetTag(oObject) != "cut10_cat2_o"
                       && GetTag(oObject) != "Cut10_Ballista1_o" && GetTag(oObject) != "Cut10_Ballista2_o"
                       && GetTag(oObject) != "cut10_dwar2" && GetTag(oObject) != "cut10_militia_d")
                    DestroyObject(oObject);
               }
          }
          oObject = GetNextObjectInArea(oArea);
     }
     // Close the doors.
    // if(GetIsOpen(oDoor1))
    //      AssignCommand(oDoor1, ActionCloseDoor(OBJECT_SELF));
    // if(GetIsOpen(oDoor2))
    //      AssignCommand(oDoor2, ActionCloseDoor(OBJECT_SELF));
}
