#include "help_general"

void GhostlyPulse(object oPC)
{
    if (GetArea(oPC) == OBJECT_SELF)
    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC, 3.0);
    }

    DelayCommand(3.0, GhostlyPulse(oPC));
}

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        SpawnBeginningItems(oPC);
        AssignCommand(oPC, ActionEquipMostEffectiveArmor());

        StopFade(oPC);

        ExploreAreaForPlayer(OBJECT_SELF, oPC);
        GhostlyPulse(oPC);

        object oSpirit = GetNearestObjectByTag("CT_UNIQ_NT_ETSP", oPC);
        SetLocalInt(oSpirit, "N_DONT_SPEAK", 0);
    }

    else
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE), oPC);
}
