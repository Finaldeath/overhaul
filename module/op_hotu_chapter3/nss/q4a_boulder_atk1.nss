//::///////////////////////////////////////////////
//:: Name q4a_boulder_atk1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script has Bessy attack the boulder.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   object oBessy = GetObjectByTag("q4a_bessy_ox");
   object oBoulder = GetObjectByTag("q4a_boulder");
   object oDonan = GetObjectByTag("q4a_donan");
   object wDonan = GetWaypointByTag("q4a_donan_wp");

   location lDonan = GetLocation(wDonan);

   AssignCommand(oBessy, ActionAttack(oBoulder));
   DelayCommand(3.5, AssignCommand(oDonan, ActionForceMoveToLocation(lDonan)));
}
