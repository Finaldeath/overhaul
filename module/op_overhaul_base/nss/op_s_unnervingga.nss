//::///////////////////////////////////////////////
//:: Unnerving Gaze
//:: op_s_unnervingga.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Wizard / Sorcerer 0
    Innate Level: 0
    School: Illusion
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Short
    Area of Effect / Target: Single humanoid creature
    Duration: 1 Round/Level
    Additional Counter Spells:
    Save: Will Negates
    Spell Resistance: Yes

    The caster makes his face resemble one of the opponent's departed loved ones or bitter enemies.

    The subject humanoid takes a -1 penalty on attack rolls for the duration of the spell.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (GetIsHumanoidCreature(oTarget))
    {
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
                {
                    effect eAttackPenalty = EffectAttackDecrease(1);
                    effect eDur = EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE);
                    effect eCessate = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
                    effect eInvalid = EffectInvalidEffect();
                    effect eLink = EffectLinkLotsOfEffects(eAttackPenalty, eDur, eCessate, eInvalid, eInvalid, eInvalid, eInvalid, eInvalid);

                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel, ROUNDS));
                }
            }
        }
    }
}

