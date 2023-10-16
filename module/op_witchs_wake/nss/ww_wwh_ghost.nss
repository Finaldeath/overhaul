//::///////////////////////////////////////////////
//:: Witch Wake: WW Handler, Ghost Target
//:: WW_WWH_Ghost.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Ghosts the Handler's target.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: December 8, 2002
//:://////////////////////////////////////////////

void main()
{
    object oTarget = GetLocalObject(OBJECT_SELF, "WitchWakeHandler_Target");
    effect eGhost = EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eGhost, oTarget);
}
