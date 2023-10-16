//::///////////////////////////////////////////////
//:: Name q4a_mine_down
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will teleport the user of the
     mineshaft rope to the mine below.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 3, 2003
//:://////////////////////////////////////////////

void main()
{
     object oPC = GetLastUsedBy();
     location lLoc = GetLocation(GetWaypointByTag("q4a_mine_down_wp"));

     AssignCommand(oPC, JumpToLocation(lLoc));
}
