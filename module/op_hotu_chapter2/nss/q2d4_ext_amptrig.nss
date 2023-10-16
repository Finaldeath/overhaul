//::///////////////////////////////////////////////
//:: Name q2d4_ext_amptrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

    Track number of PCs nearby
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 6/03
//:://////////////////////////////////////////////

void main()
{

    object oPC = GetExitingObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    SetLocalInt(OBJECT_SELF, "nPCCount", GetLocalInt(OBJECT_SELF, "nPCCount") - 1);
    object oAmplifier = GetObjectByTag("q2damplifier");
    effect eGlobe = EffectVisualEffect(VFX_IMP_SPELL_MANTLE_USE);
    DelayCommand(2.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eGlobe, oAmplifier));

}
