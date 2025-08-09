//::///////////////////////////////////////////////
//:: Word of Faith
//:: op_s_wordoffaith
//:://////////////////////////////////////////////
/*
    A wave of divine energy blasts all enemy creatures within the area of
    effect. Any hostile summoned creatures are returned to their home planes.
    Any remaining enemy creatures who hear the spell have one of these effects
    applied depending on their hit dice:

    12 or more HD: Deafened
    Less than 12 HD: Stunned, deafened
    Less than 8 HD: Confused, stunned, deafened
    Less than 4 HD: Killed, confused, stunned, deafened

    Deafened: The creature is struck deaf for 1d4 rounds.
    Stunned: The creature is stunned for 1 round.
    Confused: The creature is confused, as by the confusion spell, for 1 minute. This is a mind-affecting enchantment.
    Killed: Living creatures die. Undead creatures are destroyed.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // NB: We might want to add a custom run script to clean effects in some
    // cases of dispel magic, but for now meh - they're short durations anyway.

    effect eDeath = IgnoreEffectImmunity(EffectDeath());
    int nDeathVis = VFX_IMP_DEATH;

    ApplyVisualEffectAtLocation(VFX_FNF_WORD, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay =  GetRandomDelay(0.5, 2.0);

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            // Summon?
            if(GetAssociateType(oTarget) == ASSOCIATE_TYPE_SUMMONED ||
               GetAssociateType(oTarget) == ASSOCIATE_TYPE_FAMILIAR ||
               GetAssociateType(oTarget) == ASSOCIATE_TYPE_ANIMALCOMPANION)
            {
                // Set them to be destroyable so they fade (but leave a loot bag in case of plot)
                SetIsDestroyable(TRUE, FALSE, FALSE, oTarget);

                // This deals with Immortal and Plot flag fine.
                DelayCommand(fDelay, ApplyVisualEffectToObject(nDeathVis, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
            }
            else if (GetCanHear(oTarget))
            {
                int nHD = GetHitDice(oTarget);
                if (nHD < 4)
                {
                    // Bypasses death immunity due to the "Undead are destroyed" part. Also isn't death magic!
                    DelayCommand(fDelay, ApplyVisualEffectToObject(nDeathVis, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eDeath, oTarget));
                }
                if (nHD < 8)
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_CONFUSED))
                    {
                        effect eConfuse = GetEffectLinkIgnoreImmunity(EFFECT_TYPE_CONFUSED);
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_CONFUSION_S, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eConfuse, oTarget, GetDuration(1, MINUTES, FALSE)));
                    }
                }
                if (nHD < 12)
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_STUN))
                    {
                        effect eStun = GetEffectLinkIgnoreImmunity(EFFECT_TYPE_STUNNED);
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_STUN, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eStun, oTarget, GetDuration(1, ROUNDS, FALSE)));
                    }
                }
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DEAFNESS))
                {
                    effect eDeaf = GetEffectLinkIgnoreImmunity(EFFECT_TYPE_DEAF);
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eDeaf, oTarget, GetDuration(GetDiceRoll(1, 4), ROUNDS, FALSE)));
                }
            }
        }
    }
}

