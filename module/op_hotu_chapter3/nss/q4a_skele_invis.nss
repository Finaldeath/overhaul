//::///////////////////////////////////////////////
//:: Name q4a_skele_invis
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This script will fire the invisible skeleton
     object's heartbeat, which will cast a fake
     spell at the nearest bone golem generator.

     If the nearest generator already has 1 set of
     bones in it, it will create a bone golem.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Jan 16, 2003
//:://////////////////////////////////////////////

void main()
{
   object oGolem = GetNearestObjectByTag("q4a_golem_invis");
   object oSkeleton = GetNearestObjectByTag("SkeletalMinion");

   SetPlotFlag(OBJECT_SELF, 0);
   // Destroy the invis object.
   DelayCommand(5.0, DestroyObject(OBJECT_SELF));
   DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_RAISE_DEAD), oSkeleton));
   DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT,
                EffectVisualEffect(VFX_IMP_RAISE_DEAD), oGolem));
   // Get rid of the real skeleton corpse.
   AssignCommand(oSkeleton, SetIsDestroyable(TRUE, FALSE, FALSE));
   DelayCommand(2.0, DestroyObject(oSkeleton));
}
