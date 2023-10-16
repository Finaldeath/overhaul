#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oRidd = GetNearestObjectByTag("CT_UNIQ_NT_RD_0");

            object oInvs = GetNearestObjectByTag("PLAC_INVISIBLE", oRidd);

            SetPlotFlag(oRidd, FALSE);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_LIGHTNING, oInvs, BODY_NODE_CHEST), oRidd);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oRidd);

            DelayCommand(1.0, SetPlotFlag(oRidd, TRUE));
        }
    }
}
