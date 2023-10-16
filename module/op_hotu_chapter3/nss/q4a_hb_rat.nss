//::///////////////////////////////////////////////
//:: Name q4a_hb_rat
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script sets the facing of the rat so that
    it always looks as if it is chewing on the
    corpse. The rat will also move back to the right
    spot if it somehow gets moved.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 14, 2003
//:://////////////////////////////////////////////

void main()
{
   object oWP = GetWaypointByTag("q4a_rat_facing_wp");

   if(GetDistanceBetween(OBJECT_SELF, oWP) > 1.0)
      ActionMoveToLocation(GetLocation(oWP));
   else
      SetFacing(GetFacing(oWP));
}
