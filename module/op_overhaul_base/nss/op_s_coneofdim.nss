//::///////////////////////////////////////////////
//:: Cone of Dimness
//:: op_s_coneofdim
//:://////////////////////////////////////////////
/*
    Creatures in the cone must succeed on a Will save or believe darkness has
    engulfed them, rendering them blinded. A creature that makes its initial
    Will save suffers no ill effects. A creature that fails its initial save
    can attempt a new saving throw each round until it succeeds or the spell
    expires. Failing the subsequent saving throws results in continued
    blindness. Success on a later save means the creature feels its vision
    beginning to clear, although its vision remains dim and hazy for the
    remainder of the spell. This results in a 20% miss chance for any attack
    the creature makes.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////
// op_s_coneofdimrs - Run Script for spell

#include "op_i_spells"

const string CONE_OF_DIMNESS = "CONE_OF_DIMNESS";

void main()
{
    if (DoSpellHook()) return;

    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eRunScript = EffectRunScriptAutomatic();
    effect eBlindness = TagEffect(UnyieldingEffect(EffectBlindness()), CONE_OF_DIMNESS);
    float fDuration = GetDuration(nCasterLevel, ROUNDS);

    oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 10.0, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    while(GetIsObjectValid(oTarget))
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            // Get the distance between the target and caster to delay the application of effects
            float fDelay = GetDistanceBetween(oCaster, oTarget)/20.0;

            if (!DoResistSpell(oTarget, oCaster, fDelay))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS, fDelay))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_BLINDNESS, oCaster))
                    {
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRunScript, oTarget, fDuration));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlindness, oTarget, fDuration));
                    }
                }
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 10.0, lTarget, TRUE, OBJECT_TYPE_CREATURE);
    }
}

