//::///////////////////////////////////////////////
//:: Name q4a_sawhorse_atk
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when Bessy attacks the
     sawhorse.  It will cause her to move away from
     the sawhorse after destroying it.
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
      DelayCommand(3.2, AssignCommand(oBessy, ClearAllActions(TRUE)));
      AssignCommand(oBessy, DelayCommand(3.5, ActionForceMoveToLocation(lLoc, FALSE, 10.0)));
      AssignCommand(oBessy, DelayCommand(6.5, SetFacing(GetFacing(GetWaypointByTag("q4a_bessy_wp")))));
   }
}
