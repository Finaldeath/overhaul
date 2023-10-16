//::///////////////////////////////////////////////
//:: Name q4a_pool_enter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will teleport the user to different
     pools that are in the caves. The user must have
     used the proper item (sponge spores) to use them.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////
void main()
{
   object oObject = GetEnteringObject();
   int iItem = GetLocalInt(oObject, "q4a_water_breath");
   // Location of the destination point.
   location lPool = GetLocation(GetWaypointByTag(GetTag(OBJECT_SELF) + "_t"));

   // If the user doesn't have water breathing, let them know.
   if(iItem == 0) {
      if(GetIsPC(oObject))
      {
         //SendMessageToPC(oObject, "[NOT IN STRING EDITOR] The mining tube is surprisingly deep. You would run out of air before you made it anywhere.");
      }
   }
   else
      AssignCommand(oObject, JumpToLocation(lPool));
}
