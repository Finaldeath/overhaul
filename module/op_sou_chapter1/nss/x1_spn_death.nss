//:://////////////////////////////////////////////////
//:: x1_spn_death
/*
 * Apply EffectDeath to this creature when it spawns in
 */
//:://////////////////////////////////////////////////
//:: Copyright Bioware
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////////


void main()
{
    SetIsDestroyable(FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(500), OBJECT_SELF);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDeath(), OBJECT_SELF);
}
