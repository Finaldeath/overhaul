//::///////////////////////////////////////////////
//:: Name q4a_mine_up
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will teleport the user back up
     the mine shaft.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////

void main()
{
   object oPC = GetLastUsedBy();
   location lLoc = GetLocation(GetWaypointByTag("q4a_mine_up_wp"));

   AssignCommand(oPC, JumpToLocation(lLoc));
}
