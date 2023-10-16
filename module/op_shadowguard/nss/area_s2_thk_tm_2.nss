#include "help_general"

void UnearthlyPrison(object oAltan, object oInvs)
{
    if (GetLocalInt(GetModule(), "N_ALTAN_FREED") == 0)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_SILENT_EVIL, oInvs, BODY_NODE_CHEST), oAltan, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oAltan, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oAltan, 6.0);

        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_FREEZE_ANIMATION), oAltan, 6.0);

        DelayCommand(6.0, UnearthlyPrison(oAltan, oInvs));
    }
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) && GetFirstTimeIn())
    {
        object oAltan = GetNearestObjectByTag("CT_UNIQ_TH_ALTA", oPC);

        object oInvs = GetNearestObjectByTag("PLAC_INVISIBLE", oAltan);

        AssignCommand(oAltan, PlayAnimation(ANIMATION_LOOPING_DEAD_FRONT, 1.0, 6.0));

        DelayCommand(3.5, UnearthlyPrison(oAltan, oInvs));
    }
}
