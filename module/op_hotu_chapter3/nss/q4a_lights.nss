//::///////////////////////////////////////////////
//:: Name q4a_lights
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will cause the lights in the mine shaft
     to light up. This is done so that the PC
     can see their way through the darkness.

     This also makes the Shadow creatures vulnerable.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 6, 2003
//:://////////////////////////////////////////////
void RemoveEffects(object oObject);
void main()
{
   object oLight = GetFirstObjectInArea(GetArea(OBJECT_SELF));
   int iPulled = GetLocalInt(OBJECT_SELF, "on");
   int iReady = GetLocalInt(GetArea(OBJECT_SELF), "ready");
   // The time the lights stay on.
   float iTime = 60.0;

   if(iReady == 1)
   {
      //SendMessageToPC(GetLastUsedBy(), "[NOT IN STRING EDITOR] You must wait for the switches to reset.");
   }
   else {
   // Set switches to disabled mode.
   SetLocalInt(GetArea(OBJECT_SELF), "ready", 1);
   DelayCommand(iTime + 1.5, SetLocalInt(GetArea(OBJECT_SELF), "ready", 0));
   if(iPulled == 0) {
      PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
      SetLocalInt(OBJECT_SELF, "on", 1);
   }
   else {
      PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
      SetLocalInt(OBJECT_SELF, "on", 0);
   }
   // Do a general energy effect.
   //DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_HOWL_MIND), OBJECT_SELF));
   // If it is a light placeable, illuminate it.
   while(oLight != OBJECT_INVALID) {
      if(GetTag(oLight) == "q4a_light") {
         RemoveEffects(oLight);
         DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oLight, iTime));
         DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_LIGHT_BLUE_20), oLight, iTime));
         DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_MIND_AFFECTING_POSITIVE), oLight, iTime));
      }
      // if it is a Shadow creature, make it vulnerable.
      else if(GetTag(oLight) == "q4a_shadow"){
         RemoveEffects(oLight);
         DelayCommand(1.0, SetPlotFlag(oLight, 0));
         DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oLight, iTime));
         //DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_FROST_L), oLight));
         AssignCommand(oLight, DelayCommand(iTime + 1.0, SetPlotFlag(OBJECT_SELF, 1)));
      }
      oLight = GetNextObjectInArea(GetArea(OBJECT_SELF));
   }
   }
}

void RemoveEffects(object oObject) {
   effect eEff = GetFirstEffect(oObject);
   while(GetIsEffectValid(eEff)) {
      RemoveEffect(oObject, eEff);
      eEff = GetNextEffect(oObject);
   }
}
