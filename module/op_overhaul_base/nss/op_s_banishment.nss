//::///////////////////////////////////////////////
//:: Banishment
//:: op_s_banishment.nss
//:://////////////////////////////////////////////
/*
    Caster Level(s): Cleric 6, Wizard / Sorcerer 7
    Innate Level: 6
    School: Abjuration
    Descriptor(s):
    Component(s): Verbal, Somatic
    Range: Short
    Area of Effect / Target: Colossal
    Duration: Instant
    Additional Counter Spells:
    Save: Will negates
    Spell Resistance: Yes

    The caster is able to cause all summoned creatures, familiars, animal companions, and Outsiders in the
    area of effect to be destroyed. A number of creatures equal to twice the caster's level in HD can be banished.
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
    effect eDeath  = IgnoreEffectImmunity(EffectDeath());
    effect eVis    = EffectVisualEffect(VFX_IMP_UNSUMMON);
    effect eImpact = EffectVisualEffect(VFX_FNF_LOS_EVIL_30);

    ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, eImpact, lTarget);

    // The pool is the number of hit dice of creatures that can be banished
    int nPool = 2 * nCasterLevel;

    // Add all creatures of a given hostility to the array
    // Note old version of the spell didn't test LOS.
    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_LOWEST_HD, SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, TRUE);

    // Loop array
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);
        if (GetIsObjectValid(oTarget))
        {
            //OP_Debug("[INFO] Banishment. Target: " + GetName(oTarget) + " HD: " + IntToString(GetHitDice(oTarget)));

            // We signal this event against everyone even if it should stop early.
            SignalSpellCastAt();

            if (GetRacialType(oTarget) == RACIAL_TYPE_OUTSIDER ||
                GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED ||
                GetAssociateType(oTarget) == ASSOCIATE_TYPE_FAMILIAR ||
                GetAssociateType(oTarget) == ASSOCIATE_TYPE_ANIMALCOMPANION)
            {
                // Must be enough points in the pool to destroy target
                if (nPool >= GetHitDice(oTarget))
                {
                    nPool -= GetHitDice(oTarget);

                    float fDelay = GetRandomDelay(0.2, 0.3);
                    if (!DoResistSpell(oTarget, oCaster, fDelay) &&
                        !DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                    {
                        // Set them to be destroyable so they fade (but leave a loot bag in case of plot)
                        SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);

                        // This deals with Immortal and Plot flag fine.
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
                    }
                }
            }
        }
    }
}
