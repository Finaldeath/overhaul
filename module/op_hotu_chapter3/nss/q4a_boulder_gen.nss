//::///////////////////////////////////////////////
//:: Name q4a_boulder_gen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when Bessy attacks the
     boulders.  It will cause her to attack all the
     surrounding ones after.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 10, 2003
//:://////////////////////////////////////////////

void main()
{
   object oAttacker = GetLastAttacker();
   object oBessy = GetObjectByTag("q4a_bessy_ox");

   string sSound = "as_an_cow2";

   if(oAttacker == oBessy) {
      SetPlotFlag(OBJECT_SELF, 0);
      DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999), OBJECT_SELF));
      DelayCommand(1.7, AssignCommand(oBessy, PlaySound(sSound)));
      DelayCommand(1.8, AssignCommand(oBessy, PlayAnimation(ANIMATION_FIREFORGET_TAUNT)));
   }
}
