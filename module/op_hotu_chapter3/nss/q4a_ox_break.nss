//::///////////////////////////////////////////////
//:: Name q4a_ox_break
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will cause Bessy the ox to smash
     the boulder that is blocking the doorway.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 8, 2003
//:://////////////////////////////////////////////

void main()
{
   object oBessy = GetObjectByTag("q4a_bessy_ox");
   object oBoulder = GetObjectByTag("q4a_boulder");
   object oBoulder2 = GetObjectByTag("q4a_boulder2");
   object oSawhorse = GetObjectByTag("q4a_sawhorse");
   object oSawhorse2 = GetObjectByTag("q4a_sawhorse2");
   object oDonan = GetObjectByTag("q4a_donan");
   object wDonan = GetWaypointByTag("q4a_donan_wp");

   location lDonan = GetLocation(wDonan);
   location lLoc = GetLocation(GetWaypointByTag("q4a_bessy_wp"));

   string sSound = "as_an_cow2";

   AssignCommand(oDonan, SetFacingPoint(GetPosition(oBoulder)));
   AssignCommand(oBessy, PlaySound(sSound));
   DelayCommand(0.1, AssignCommand(oBessy, ActionMoveToObject(oBoulder2, TRUE, 0.1)));
   DelayCommand(0.2, SetPlotFlag(oBoulder, 0));
   DelayCommand(2.6, AssignCommand(oBessy, ClearAllActions()));
   DelayCommand(2.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999), oBoulder));
   DelayCommand(3.5, AssignCommand(oDonan, ActionForceMoveToLocation(lDonan)));
   DelayCommand(5.7, AssignCommand(oDonan, SetFacing(GetFacing(wDonan))));
   DelayCommand(3.9, AssignCommand(oBessy, PlaySound(sSound)));
   DelayCommand(4.0, AssignCommand(oBessy, ActionForceMoveToObject(oSawhorse2, TRUE, 0.1)));
   DelayCommand(4.2, SetPlotFlag(oSawhorse, 0));
   DelayCommand(7.4, AssignCommand(oBessy, ClearAllActions()));
   DelayCommand(7.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999), oSawhorse));
   DelayCommand(8.7, AssignCommand(oBessy, PlaySound(sSound)));
   DelayCommand(8.8, AssignCommand(oBessy, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
   DelayCommand(9.5, AssignCommand(oBessy, ActionForceMoveToLocation(lLoc, FALSE, 10.0)));
}
