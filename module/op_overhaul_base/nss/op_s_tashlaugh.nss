//::///////////////////////////////////////////////
//:: Tasha's Hideous Laughter
//:: op_s_tashlaugh.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Bard 2, Wizard / Sorcerer 2
    Innate Level: 2
    School: Enchantment
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Short
    Area of Effect / Target: Single
    Duration: 1d3 rounds
    Additional Counter Spells:
    Save: Will negates
    Spell Resistance: Yes

    If the target fails their saving throw they will begin laughing hysterically
    being knocked down onto the ground. They will be unable to defend themselves
    until the spell wears off. A creature whose racial type is different from
    the caster's gains a +4 bonus on its saving throw because humor doesn't
    'translate' well.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // * creatures of different race find different things funny
    if (GetRacialType(oTarget) != GetRacialType(oCaster))
    {
        nSpellSaveDC -= 4;
    }

    // Usually 1 round/level but Bioware limited to 1d3 rounds. Might up it sometime...
    float fDur = GetDuration(d3(1), ROUNDS);

    effect eLink =
        EffectLinkEffects(EffectKnockdown(),
        EffectLinkEffects(EffectIcon(EFFECT_ICON_KNOCKDOWN),
        EffectLinkEffects(EffectRunScriptAutomatic(),
        EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                          EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED)))));

    // Ignore knockdown resistance
    eLink = IgnoreEffectImmunity(eLink);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        SignalSpellCastAt();

        // Checking if dead also because we're replacing "dead" animations
        if (!GetIsMindless(oTarget) && !GetIsDead(oTarget))
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_MIND_SPELLS))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDur);
                }
            }
        }
    }
}

