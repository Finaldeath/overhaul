//::///////////////////////////////////////////////
//:: Name: act_ddoor_destry
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If the door was not created for the PC speaker,
    damage the speaker and destroy the door
*/
//:://////////////////////////////////////////////
//:: Created By: Keith warner
//:: Created On: Jan 16/03
//:://////////////////////////////////////////////

void main()
{
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectDamage(d20()), EffectVisualEffect(VFX_IMP_DOMINATE_S)), GetPCSpeaker());
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_DISPEL_GREATER), GetLocation(GetObjectByTag("x2_deathdoor")));
    DestroyObject(GetObjectByTag("x2_deathdoor"), 0.5);
}
