//::///////////////////////////////////////////////
//:: Dismissal
//:: op_s_dismissal.nss
//:://////////////////////////////////////////////
/*
    This spell forces the targeted outsider, summoned creature, animal companions or
    familiars back to their proper plane. The saving throw is modified by adding
    your caster level, and taking off the targets hit dice.

    Single target version of Banishment.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Effects
    effect eDeath = IgnoreEffectImmunity(EffectDeath());
    effect eVis   = EffectVisualEffect(VFX_IMP_UNSUMMON);

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
    {
        // We signal this event against everyone
        SignalSpellCastAt();

        if (GetRacialType(oTarget) == RACIAL_TYPE_OUTSIDER ||
            GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED ||
            GetAssociateType(oTarget) == ASSOCIATE_TYPE_FAMILIAR ||
            GetAssociateType(oTarget) == ASSOCIATE_TYPE_ANIMALCOMPANION)
        {
            float fDelay = GetRandomDelay(0.2, 0.3);

            int nNewSaveDC = max(1, nSpellSaveDC + nCasterLevel - GetHitDice(oTarget));

            if (!DoResistSpell(oTarget, oCaster, fDelay) &&
                !DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nNewSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
            {
                // Set them to be destroyable so they fade (but leave a loot bag in case of plot)
                SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);

                // This deals with Immortal and Plot flag fine.
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            }
        }
        else
        {
            FloatingTextStringOnCreature("*Target is not an outsider, summon, familiar or animal companion.", oCaster, FALSE);
        }
    }
}
