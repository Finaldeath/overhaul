//::///////////////////////////////////////////////
//:: Spell Mantle
//:: op_s_spellmantle.nss
//:://////////////////////////////////////////////
/*
    Absorbs all spells to a certain amount:

    Lesser:  1d4 + 6
    Normal:  1d8 + 8
    Greater: 1d12 + 10
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    SignalSpellCastAt();

    int nAbsorb;
    switch (nSpellId)
    {
        case SPELL_LESSER_SPELL_MANTLE:  nAbsorb = GetDiceRoll(1, 4, 6); break;
        case SPELL_SPELL_MANTLE:         nAbsorb = GetDiceRoll(1, 8, 8); break;
        case SPELL_GREATER_SPELL_MANTLE: nAbsorb = GetDiceRoll(1, 12, 10); break;
        default:
        {
            OP_Debug("[Spell Mantle] No valid spell ID provided.", LOG_LEVEL_ERROR);
            return;
        }
        break;
    }

    effect eLink = EffectLinkEffects(EffectSpellLevelAbsorption(9, nAbsorb),
                   EffectLinkEffects(EffectVisualEffect(VFX_DUR_SPELLTURNING),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

    // Remove all existing spells
    RemoveEffectsFromSpell(oTarget, SPELL_LESSER_SPELL_MANTLE);
    RemoveEffectsFromSpell(oTarget, SPELL_SPELL_MANTLE);
    RemoveEffectsFromSpell(oTarget, SPELL_GREATER_SPELL_MANTLE);

    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
}

