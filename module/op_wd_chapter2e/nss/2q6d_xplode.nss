//::///////////////////////////////////////////////
//:: Makes the brazier explode
//:: 2q6d_xplode
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This makes the brazier explode in a fireball
    doing a small amount of damge to all within
    range.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 26, 2002
//:://////////////////////////////////////////////
#include "nw_i0_spells"
void main()
{
    effect eDam;
    int nDamage = d6(2);
    effect eVis = EffectVisualEffect(VFX_FNF_FIREBALL);
    effect eFlame = EffectVisualEffect(VFX_IMP_FLAME_M);
    effect eShake = EffectVisualEffect(286);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eShake, GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 3.1);
    DelayCommand(3.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF)));

    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), TRUE);
    while(GetIsObjectValid(oTarget))
    {
        if(MySavingThrow(SAVING_THROW_REFLEX, oTarget, 14, SAVING_THROW_TYPE_FIRE))
        {
            nDamage /= 2;
        }
        effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
        if(nDamage > 0)
        {
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eFlame, oTarget));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        }
        oTarget = GetNextObjectInShape(SHAPE_SPHERE, 30.0, GetLocation(OBJECT_SELF), TRUE);
    }
}
