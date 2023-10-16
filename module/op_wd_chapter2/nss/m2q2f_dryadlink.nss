//::///////////////////////////////////////////////
//:: Damaged
//:: M2Q2F_DryadLink
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the dryad's tree gets damaged, the dryad
    feels the damage as well.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 3, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDryad = GetNearestObjectByTag("M2Q2FDryad");

    int nDamage = GetCurrentHitPoints(oDryad) - GetCurrentHitPoints(OBJECT_SELF);

    if (nDamage > 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(nDamage),oDryad);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_EVIL),oDryad);
        SetIsTemporaryEnemy(GetLastAttacker(),oDryad);
    }
}
