//::///////////////////////////////////////////////
//:: Planar Binding
//:: op_s_planarbind.nss
//:://////////////////////////////////////////////
/*
    Planar Binding style spells.

    Summon only - Evil: Succubus, Neutral: Green slaad, Good: Hound archon

    Lesser Planar Binding
    Target: Outsider try and paralyze. Else summon: Evil: Imp. Neutral: Red Slaad. Good: Lantern Archon

    Planar Binding
    Target: Outsider try and paralyze. Else summon: Evil: Succubus, Neutral: Green Slaad, Good: Hound Archon
    Planar Ally: as Planar Binding but no paralysis.

    Greater Planar Binding
    Target: Outsider try and paralyze. Else summon: Evil: Vrock, Neutral: Death Slaad, Good: Celestial Avenger
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Targeted will do paralysis in some cases
    if (GetIsObjectValid(oTarget) && GetRacialType(oTarget) == RACIAL_TYPE_OUTSIDER)
    {
        if (nSpellId == SPELL_LESSER_PLANAR_BINDING ||
            nSpellId == SPELL_PLANAR_BINDING ||
            nSpellId == SPELL_LESSER_PLANAR_BINDING)
        {
            SignalSpellCastAt(oTarget, oCaster, TRUE);

            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    // Keeping the spell save modifiers for now
                    if (nSpellId == SPELL_PLANAR_BINDING) nSpellSaveDC += 2;
                    if (nSpellId == SPELL_GREATER_PLANAR_BINDING) nSpellSaveDC += 5;

                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC))
                    {
                        effect eLink = EffectLinkEffects(EffectParalyze(),
                                                         EffectLinkEffects(EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE),
                                                                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_PARALYZED),
                                                                                             EffectVisualEffect(VFX_DUR_PARALYZE_HOLD))));

                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nCasterLevel / 2, ROUNDS));
                    }
                }
            }
            return;
        }
    }

    int nAlign = GetAlignmentGoodEvil(OBJECT_SELF);
    // Get the summon to use depends on alignment and the spell ID
    effect eSummon;

    switch (nSpellId)
    {
        case SPELL_LESSER_PLANAR_BINDING:
        {
            switch (GetAlignmentGoodEvil(oCaster))
            {
                case ALIGNMENT_EVIL:
                {
                    eSummon = EffectSummonCreature("NW_S_IMP", VFX_FNF_SUMMON_GATE, 3.0);
                }
                break;
                case ALIGNMENT_GOOD:
                {
                    eSummon = EffectSummonCreature("NW_S_CLANTERN", VFX_FNF_SUMMON_CELESTIAL, 3.0);
                }
                break;
                case ALIGNMENT_NEUTRAL:
                {
                    eSummon = EffectSummonCreature("NW_S_SLAADRED", VFX_FNF_SUMMON_MONSTER_3, 3.0);
                }
                break;
            }
        }
        break;
        case SPELL_PLANAR_ALLY:
        case SPELL_PLANAR_BINDING:
        {
            switch (GetAlignmentGoodEvil(oCaster))
            {
                case ALIGNMENT_EVIL:
                {
                    eSummon = EffectSummonCreature("NW_S_SUCCUBUS", VFX_FNF_SUMMON_GATE, 3.0);
                }
                break;
                case ALIGNMENT_GOOD:
                {
                    eSummon = EffectSummonCreature("NW_S_CHOUND", VFX_FNF_SUMMON_CELESTIAL, 3.0);
                }
                break;
                case ALIGNMENT_NEUTRAL:
                {
                    eSummon = EffectSummonCreature("NW_S_SLAADGRN", VFX_FNF_SUMMON_MONSTER_3, 3.0);
                }
                break;
            }
        }
        break;
        case SPELL_GREATER_PLANAR_BINDING:
        {
            switch (GetAlignmentGoodEvil(oCaster))
            {
                case ALIGNMENT_EVIL:
                {
                    eSummon = EffectSummonCreature("NW_S_VROCK", VFX_FNF_SUMMON_GATE, 3.0);
                }
                break;
                case ALIGNMENT_GOOD:
                {
                    eSummon = EffectSummonCreature("NW_S_CTRUMPET", VFX_FNF_SUMMON_CELESTIAL, 3.0);
                }
                break;
                case ALIGNMENT_NEUTRAL:
                {
                    eSummon = EffectSummonCreature("NW_S_SLAADDETH", VFX_FNF_SUMMON_MONSTER_3, 3.0);
                }
                break;
            }
        }
        break;
        default:
        {
            Debug("[Planar Binding] Unknown spell ID: " + IntToString(nSpellId), ERROR);
            return;
        }
        break;
    }

    // Summon effects are extraordinary, Dispel Magic can be done on the summon itself
    eSummon = ExtraordinaryEffect(eSummon);

    ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eSummon, lTarget, GetDuration(nCasterLevel, HOURS));
}
