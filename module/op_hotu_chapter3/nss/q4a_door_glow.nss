//::///////////////////////////////////////////////
//:: Name q4a_door_glow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Causes an effect on the bridge door.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 20, 2002
//:://////////////////////////////////////////////

void main()
{
   if(!GetIsOpen(OBJECT_SELF)) {
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR), OBJECT_SELF, 7.0);
   }
}
