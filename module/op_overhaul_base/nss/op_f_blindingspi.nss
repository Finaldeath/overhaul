//::///////////////////////////////////////////////
//:: Blinding Spittle
//:: op_f_blindingspi.nss
//:://////////////////////////////////////////////
/*
    Type of Feat: Class
    Prerequisite: Eye of Gruumsh level 4.
    Specifics: At 4th level, an Eye of Gruumsh can launch blinding spittle at
    any opponent within short range. Using a ranged touch attack (at a -4
    penalty), he spits his stomach acid into the target's eyes. An opponent who
    fails a Reflex save (DC 10 + eye of Gruumsh level + Eye of Gruumsh's
    Constitution bonus) is blinded 3 rounds. This
    attack has no effect on creatures that don't have eyes or don't depend on
    vision. Blinding spittle is usable 2/day at 4th level and 4/day at 7th level.
    Use: Selected.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eVis   = EffectVisualEffect(VFX_IMP_ACID_L);
    effect eBlind = EffectBlindness();

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        if (DoTouchAttack(oTarget, oCaster, TOUCH_RANGED))
        {
            float fDuration = GetDuration(3, ROUNDS);
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oTarget, fDuration);
        }
    }
}
