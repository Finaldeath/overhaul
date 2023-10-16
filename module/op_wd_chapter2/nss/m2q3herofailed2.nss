//::///////////////////////////////////////////////
//:: Attacked
//:: m2q3HeroFailed2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The PC attacks Maegel.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 20, 2001
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(5,DAMAGE_TYPE_FIRE),GetLastAttacker());
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_S),GetLastAttacker());
    DestroyObject(OBJECT_SELF);
}
