//::///////////////////////////////////////////////
//:: Name hx_mimic_spawn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will apply a visual effect to the mimic
     lever so it is easier to see.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: July 31, 2003
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOW_LIGHT_RED), OBJECT_SELF);
}
