//::///////////////////////////////////////////////
//:: Name q4a_hole_jump
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will jump the PC through the hole
     in the crates after they are first in pixie
     form.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 13, 2003
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    object oWP1 = GetWaypointByTag("q4a_rat_wp1");
    object oWP2 = GetWaypointByTag("q4a_rat_wp2");
    location lLoc1 = GetLocation(oWP1);
    location lLoc2 = GetLocation(oWP2);

    // Check to see if the polmorph has worn out while in
    // the conv.
    if(GetAppearanceType(oPC) == APPEARANCE_TYPE_FAIRY) {
       if(GetDistanceBetween(oPC, oWP1) > GetDistanceBetween(oPC, oWP2))
          AssignCommand(oPC, JumpToLocation(lLoc1));
       else
          AssignCommand(oPC, JumpToLocation(lLoc2));
    }
}
