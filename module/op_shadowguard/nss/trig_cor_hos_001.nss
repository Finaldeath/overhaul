#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oOkar = GetNearestObjectByTag("CT_UNIQ_NT_OKAR", oPC);

            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oOkar);
        }
    }
}
