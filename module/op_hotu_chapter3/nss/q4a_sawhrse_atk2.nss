//::///////////////////////////////////////////////
//:: Name q4a_sawhrse_atk2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire when Bessy attacks the
     sawhorse.  It will cause her to attack the
     2nd sawhorse after destroying first.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 9, 2003
//:://////////////////////////////////////////////

void main()
{
   object oAttacker = GetLastAttacker();
   object oBessy = GetObjectByTag("q4a_bessy_ox");
   object oSawhorse = GetObjectByTag("q4a_sawhorse");

   if(oAttacker == oBessy) {
      SetPlotFlag(OBJECT_SELF, 0);
      DelayCommand(0.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(9999), OBJECT_SELF));
      DelayCommand(1.2, AssignCommand(oBessy, ActionAttack(oSawhorse)));
   }
}
