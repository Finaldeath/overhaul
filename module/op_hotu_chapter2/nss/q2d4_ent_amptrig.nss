//::///////////////////////////////////////////////
//:: Name q2d4_ent_amptrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Amplifier Device Trigger...
    trigger the effects on the amplifier
    Track number of PCs nearby
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nPCCount", GetLocalInt(OBJECT_SELF, "nPCCount") + 1);
    object oAmplifier = GetObjectByTag("q2damplifier");
    AssignCommand(oAmplifier, ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE));

    effect eGlobe = EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlobe, oAmplifier));

    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    object oPillar1 = GetObjectByTag("q2d4pillar1");
    object oPillar2 = GetObjectByTag("q2d4pillar2");
    object oPillar3 = GetObjectByTag("q2d4pillar3");
    effect ePillar = EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR);
    //effect ePillar = EffectVisualEffect(VFX_DUR_GHOSTLY_PULSE);

    //effect ePillar = EffectLinkEffects(ePillar1, ePillar2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePillar, oPillar1);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePillar, oPillar2);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePillar, oPillar3);

}
