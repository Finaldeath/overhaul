//::///////////////////////////////////////////////
//:: Name q4a_miner_cr
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script creates the miner that gives the
     clue about the boss in the mines.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   object oEnter = GetEnteringObject();
   object oWP = GetWaypointByTag("q4a_miner_wp");
   location lLoc = GetLocation(oWP);

   if(GetIsPC(oEnter)) {
      if(oWP != OBJECT_INVALID) {
         CreateObject(OBJECT_TYPE_CREATURE, "miner001", lLoc);
         DestroyObject(oWP);
      }
   }
}
