//::///////////////////////////////////////////////
//:: Name q4a_area_exit
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will kill the spawned in tiles
     and healing rods to avoid the heartbeats.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 15, 2003
//:://////////////////////////////////////////////

void main()
{
   // Destroy the healing statues and the lava tiles.

   object oObject = GetFirstObjectInArea(OBJECT_SELF);
   // Int used to tell whether a PC is present or not in the area.
   int iPC = 0;
   while(oObject != OBJECT_INVALID) {
      if(GetIsPC(oObject))
         iPC = 1;
      oObject = GetNextObjectInArea(OBJECT_SELF);
   }

   // Reset the object.
   oObject = GetFirstObjectInArea(OBJECT_SELF);

   // No PCs left, destroy the tiles and the heal rods. Reset the
   // area int so that the objects will be created again if/when they
   // return.
   if(iPC == 1) {
      while(oObject != OBJECT_INVALID) {
         if(GetTag(oObject) == "q4a_heal_rod" || GetTag(oObject) == "q5firetile")
            DestroyObject(oObject);
         oObject = GetNextObjectInArea(OBJECT_SELF);
      }
      SetLocalInt(OBJECT_SELF, "nDoOnce", 0);
   }
}
