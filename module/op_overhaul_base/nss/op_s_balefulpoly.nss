//::///////////////////////////////////////////////
//:: Baleful Polymorph
//:: op_s_balefulpoly.nss
//:://////////////////////////////////////////////
/*
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
        SignalSpellCastAt();

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
                float fDuration   = GetDuration(nCasterLevel, ROUNDS);

                ApplyVisualEffectToObject(VFX_IMP_POLYMORPH, oTarget);
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, ePolymorph, oTarget, fDuration);
            }
        }
    }
}
