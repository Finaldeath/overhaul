//::///////////////////////////////////////////////
//:: Name q2d4_hb_amptrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Amplifier Device effects...
    trigger the effects on the amplifier

*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{
    //if there are PCs in the area
    if (GetLocalInt(OBJECT_SELF, "nPCCount") > 0)
    {
        object oAmplifier = GetObjectByTag("q2damplifier");
        if (GetIsObjectValid(oAmplifier) == TRUE)
        {
            effect eGlobe = EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
            DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlobe, oAmplifier));
            DelayCommand(5.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlobe, oAmplifier));
            object oTarget = GetObjectByTag("q2d4_amptarget_" + IntToString(Random(3) + 1));
            DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, oAmplifier, BODY_NODE_CHEST), oTarget, 3.0));
            DelayCommand(IntToFloat(Random(5) + 1), ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), oAmplifier));
        }
    }
}
