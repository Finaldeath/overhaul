//::///////////////////////////////////////////////
//:: Baleful Polymorph
//:: op_s_balefulpoly.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Druid 5, Wizard / Sorcerer 5
    Innate Level: 5
    School: Transmutation
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Short
    Area of Effect / Target: Single
    Duration: 1 Round / Level
    Additional Counter Spells: Polymorph Self, Shapechange
    Save: Fortitude Negates
    Spell Resistance: Yes

    You change the subject into a chicken. They cannot cast spells and gain the physical characteristics of a chicken.

    Shapechangers, gaseous and incorporeal creatures cannot be affected by this spell.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE) &&
        GetObjectType(oTarget) == OBJECT_TYPE_CREATURE)
    {
        SignalSpellCastAt(oTarget, oCaster, TRUE);

        // Deal with invalid targets and feedback
        if (GetRacialType(oTarget) == RACIAL_TYPE_SHAPECHANGER ||
            GetLevelByClass(CLASS_TYPE_SHAPECHANGER, oTarget) > 0 ||
            GetPlotFlag(oTarget) || GetIsDM(oTarget) ||
            GetIsIncorporeal(oTarget) ||
            GetHasEffect(oTarget, EFFECT_TYPE_PETRIFY) ||
            GetIsDead(oTarget))
        {
            SendMessageToPC(oCaster, "*Baleful Polymoprh cannot affect this target*");
            return;
        }

        if (!DoResistSpell(oTarget, oCaster))
        {
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC))
            {
                effect ePolymorph = EffectPolymorph(POLYMORPH_TYPE_CHICKEN, TRUE);
                effect eVis = EffectVisualEffect(VFX_IMP_POLYMORPH);
                float fDuration = GetDuration(nCasterLevel, ROUNDS);

                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePolymorph, oTarget, fDuration);
            }
        }
    }
}

