//::///////////////////////////////////////////////
//:: Name q2d1_dest_watfall
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Destroy the illusionary waterfall as the PC approaches
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 31/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);

    object oWaterfall = GetObjectByTag("q2d1_vfx_waterfall");
    object oVfx1 = GetObjectByTag("q2d1_vfx_wat1");
    object oVfx2 = GetObjectByTag("q2d1_vfx_wat2");

    effect eVfx1 = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eVfx2 = EffectVisualEffect(VFX_IMP_HEALING_M);
    effect eVfx3 = EffectVisualEffect(VFX_IMP_SILENCE);
    effect eVfx4 = EffectVisualEffect(VFX_IMP_HEALING_M);
    effect eVfx5 = EffectVisualEffect(VFX_IMP_DEATH);
    effect eVfx6 = EffectVisualEffect(VFX_IMP_BREACH);
    effect eVfx7 = EffectVisualEffect(321);//Pixie Dust

    effect eLink1 = EffectLinkEffects(eVfx1, eVfx2);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eLink1, GetLocation(oWaterfall));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx5, GetLocation(oVfx1));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx5, GetLocation(oVfx2));
    DestroyObject(oWaterfall, 1.0);

}
