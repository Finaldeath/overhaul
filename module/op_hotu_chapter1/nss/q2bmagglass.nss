//::///////////////////////////////////////////////
//:: Name q2bmagglass
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//If a PC uses Halaster's Magnifying Glass on a formian - instant death
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: August 13/03
//:://////////////////////////////////////////////

void main()
{

    object oSpellTarget =  GetSpellTargetObject();

    if (GetAppearanceType(oSpellTarget) == APPEARANCE_TYPE_FORMIAN_MYRMARCH ||
            GetAppearanceType(oSpellTarget) == APPEARANCE_TYPE_FORMIAN_QUEEN ||
            GetAppearanceType(oSpellTarget) == APPEARANCE_TYPE_FORMIAN_WARRIOR ||
            GetAppearanceType(oSpellTarget) == APPEARANCE_TYPE_FORMIAN_WORKER)
    {
        effect eSun = EffectVisualEffect(VFX_FNF_SUNBEAM);
        effect eSmoke = EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
        effect eDeath = EffectDeath(TRUE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(eSun, eSmoke), GetLocation(oSpellTarget));
        CreateObject(OBJECT_TYPE_PLACEABLE, "plc_weathmark", GetLocation(oSpellTarget));
        DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oSpellTarget));

    }

}
