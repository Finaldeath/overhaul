#include "help_general"

void DoStop(object o, object oSelf)
{
    if (GetLocalInt(o, "N_STOPPED") == 0)
    {
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWSTUN), o);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(), o, 1.0);

        SetLocalInt(o, "N_STOPPED", 1);
    }
}

void main()
{
    object o = GetEnteringObject();

    if (GetTag(o) == "CT_UNIQ_SG_MARK" || GetTag(o) == "CT_UNIQ_SH_HARK")
        DoStop(o, OBJECT_SELF);
}
