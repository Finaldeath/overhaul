//::///////////////////////////////////////////////
//:: Name q4a_heal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will check for hostiles or anyone
    wearing the right item and heal them. Others
    will be damaged.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 10, 2003
//:://////////////////////////////////////////////
void DoAction();
void main()
{
   int iRandom = Random(6);
   float fDelay = IntToFloat(iRandom);
   DelayCommand(fDelay, DoAction());
}
void DoAction() {
   object oObject = GetFirstObjectInShape(SHAPE_SPHERE, 6.5, GetLocation(OBJECT_SELF),
                                          OBJECT_TYPE_CREATURE);


   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), OBJECT_SELF);
   while(oObject != OBJECT_INVALID) {
      // Check if they are hostile or have the right item.
      if(GetIsFriend(oObject) || GetTag(GetItemInSlot(INVENTORY_SLOT_NECK, oObject)) == "q4a_heal_item") {
         if(!GetIsDead(oObject)) {
            // Do the individual effects.
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_EVIL_HELP), oObject));
            // Do the healing.
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectHeal(Random(30) + 10), oObject));
         }
      }
      // If they aren't a friend, harm them.
      else {
         if(!GetIsDead(oObject)) {
            // Do the individual effect.
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY), oObject));
            // Do the damage.
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(Random(20) + 5), oObject));
         }
      }
      oObject = GetNextObjectInShape(SHAPE_SPHERE, 6.5, GetLocation(OBJECT_SELF),
                                          OBJECT_TYPE_CREATURE);
   }
}
