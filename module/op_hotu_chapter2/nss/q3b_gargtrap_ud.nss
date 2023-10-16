// gargoyle trap user-defined events

#include "NW_I0_SPELLS"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if(nEvent == 101)
    {
        object oPC = GetLocalObject(GetArea(OBJECT_SELF), "TRAP_TARGET");
        object oArmand = GetNearestObjectByTag("q3_armand");
        float fDistance = GetDistanceBetween(oArmand, OBJECT_SELF);
        // First, drain the player anyway
        int nDamage = d6(6) + 6;

        effect eVis = EffectVisualEffect(VFX_IMP_NEGATIVE_ENERGY);
        effect eDam = EffectDamage(nDamage, DAMAGE_TYPE_NEGATIVE);
        effect eRay = EffectBeam(VFX_BEAM_EVIL, OBJECT_SELF, BODY_NODE_CHEST);

        if(MySavingThrow(SAVING_THROW_REFLEX, oPC, 24, SAVING_THROW_TYPE_NEGATIVE))
            nDamage /= 2;

        DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oPC));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oPC, 1.7);

        if(fDistance <= 20.0)
        {
            eRay = EffectBeam(VFX_BEAM_EVIL, OBJECT_SELF, BODY_NODE_CHEST);
            effect eVisHeal = EffectVisualEffect(VFX_IMP_HEALING_M);
            effect eHeal = EffectHeal(nDamage * 2);
            DelayCommand(0.8, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eRay, oArmand, 1.7));
            DelayCommand(0.8 + 0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisHeal, oArmand));
            DelayCommand(0.8 + 0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oArmand));
        }

    }
}
