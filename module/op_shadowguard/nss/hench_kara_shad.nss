#include "help_hench"

void main()
{
    object oPC = GetPCSpeaker();

    object oShadow = CreateHenchman(oPC, "HENCH_KSHA", GetLocation(OBJECT_SELF));

    SetLocalInt(oShadow, "N_SUMMONED", 1);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oShadow));

    AddHenchman(OBJECT_SELF, oShadow);

    SetLocalInt(GetModule(), GetTag(OBJECT_SELF) + "_N_DAILY_SHAD_SUMMON", 1);
}
