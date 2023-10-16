#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oKing = GetNearestObjectByTag("CT_UNIQ_NT_DL_0");

            object oInvs = GetNearestObjectByTag("PLAC_INVISIBLE", oKing);

            object oFloorDesign = GetNearestObjectByTag("PLAC_FLOOR_DESIGN", oKing);

            SetPlotFlag(oKing, FALSE);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectBeam(VFX_BEAM_SILENT_HOLY, oInvs, BODY_NODE_CHEST), oKing);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oKing);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oFloorDesign);

            DelayCommand(1.0, SetPlotFlag(oKing, TRUE));
        }
    }
}
