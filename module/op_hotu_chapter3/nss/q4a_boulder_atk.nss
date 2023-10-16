//::///////////////////////////////////////////////
//:: Name q4a_boulder_atk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when Bessy attacks the
     boulder.  It will cause her to move away from
     it after destroying it.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   object oAttacker = GetLastAttacker();
   object oBessy = GetObjectByTag("q4a_bessy_ox");

   location lLoc = GetLocation(GetWaypointByTag("q4a_bessy_wp"));

   string sSound = "as_an_cow2";

   if(oAttacker == oBessy) {
      SetPlotFlag(OBJECT_SELF, 0);
      DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999), OBJECT_SELF));
      DelayCommand(1.7, AssignCommand(oBessy, PlaySound(sSound)));
      DelayCommand(1.8, AssignCommand(oBessy, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
      AssignCommand(oBessy, DelayCommand(3.2, ClearAllActions(TRUE)));
      AssignCommand(oBessy, DelayCommand(4.5, ActionMoveToLocation(lLoc, FALSE)));
      AssignCommand(oBessy, DelayCommand(15.5, SetFacing(GetFacing(GetWaypointByTag("q4a_bessy_wp")))));
   }
}
