//::///////////////////////////////////////////////
//:: Spellcast
//:: m2q3HeroFailed3
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
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(5,DAMAGE_TYPE_FIRE),GetLastSpellCaster());
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_IMP_FLAME_S),GetLastSpellCaster());
    DestroyObject(OBJECT_SELF);
}
