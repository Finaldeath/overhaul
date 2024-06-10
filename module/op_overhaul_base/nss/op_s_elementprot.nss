//::///////////////////////////////////////////////
//:: Protection from Element spell line
//:: op_s_elementprot.nss
//:://////////////////////////////////////////////
/*
    Endure Elements

    The target creature gains damage resistance 10/- against all elemental forms
    of damage. The spell ends after absorbing 20 points of damage from any
    single elemental type.

    Resist Elements

    20/- against 30 points of damage.

    Protection from Elements

    30/- against 40 points of damage.

    Energy Buffer

    40/- against 60 points of damage.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    int nResistance, nAmount;

    switch(nSpellId)
    {
        case SPELL_ENDURE_ELEMENTS:
            nResistance = 10;
            nAmount = 20;
        break;
        case SPELL_RESIST_ELEMENTS:
            nResistance = 20;
            nAmount = 30;
        break;
        case SPELL_PROTECTION_FROM_ELEMENTS:
            nResistance = 30;
            nAmount = 40;
        break;
        case SPELL_ENERGY_BUFFER:
            nResistance = 40;
            nAmount = 60;
        break;
    }

    // Remove existing effects
    RemoveEffectsFromSpell(oTarget, nSpellId);

    SignalSpellCastAt();

    effect eLink =
        EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_ACID | DAMAGE_TYPE_COLD | DAMAGE_TYPE_ELECTRICAL | DAMAGE_TYPE_FIRE | DAMAGE_TYPE_SONIC, nResistance, nAmount),
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS),
                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
    effect eVis = EffectVisualEffect(VFX_IMP_ELEMENTAL_PROTECTION);

    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, MINUTES));
}

