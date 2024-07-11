//::///////////////////////////////////////////////
//:: Cloudkill
//:: op_s_cloudkill
//:://////////////////////////////////////////////
/*
    A billowing cloud of noxious vapors settles over the area.

    The effects each round vary according to the Hit Dice of the affected
    creatures:
    1-3 HD: Instant death
    4-6 HD: Fortitude save vs. poison or death
    Anyone who is still alive takes 1d10 acid damage.

    Note being immune to death magic doesn't protect you from this spell
    but immunity to poison does.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            ApplyAOEPersistentRunScriptEffect(oTarget);

            if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_POISON, oCaster))
            {
                if (!DoResistSpell(oTarget, oCaster))
                {
                    int nHitDice = GetHitDice(oTarget);
                    if (nHitDice <= 3)
                    {
                        ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, IgnoreEffectImmunity(EffectDeath()), oTarget);
                        return;
                    }
                    // Fort save or movement speed decrease (or death if < 6HD)
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_POISON))
                    {
                        if (nHitDice <= 6)
                        {
                            ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, IgnoreEffectImmunity(EffectDeath()), oTarget);
                            return;
                        }
                    }

                    // 1d10 Acid Damage
                    int nDamage = GetDiceRoll(1, 10);

                    ApplyVisualEffectToObject(VFX_IMP_POISON_L, oTarget);
                    ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID);
                }
            }
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all tagged effects with our OID in it as set before
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));
    }
    else if (GetLastRunScriptEffectScriptType() == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        if (!AOECheck()) return;

        if (!GetIsImmuneWithFeedback(oTarget, IMMUNITY_TYPE_POISON, oCaster))
        {
            if (!DoResistSpell(oTarget, oCaster))
            {
                int nHitDice = GetHitDice(oTarget);
                if (nHitDice <= 3)
                {
                    ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, IgnoreEffectImmunity(EffectDeath()), oTarget);
                    return;
                }
                // Fort save or death if < 6HD
                if (nHitDice <= 6)
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_POISON))
                    {
                        ApplyVisualEffectToObject(VFX_IMP_DEATH, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_INSTANT, IgnoreEffectImmunity(EffectDeath()), oTarget);
                        return;
                    }
                }

                // 1d10 Acid Damage
                int nDamage = GetDiceRoll(1, 10);

                ApplyVisualEffectToObject(VFX_IMP_POISON_L, oTarget);
                ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_ACID);
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        AOECheck();
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_GAS_EXPLOSION_EVIL, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOGKILL, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS));
    }
}

