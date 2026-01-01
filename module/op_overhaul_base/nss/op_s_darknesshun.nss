//:://////////////////////////////////////////////
//:: Hungry Darkness
//:: op_s_darknesshun
//:://////////////////////////////////////////////
/*
    Warlock Darkness spell but with bat damage.

    Main thing is the engine does check for SPELL_DARKNESS on the AOE effect
    oddly so we'll apply every instance of this as SPELL_DARKNESS 100% (even
    if called as an illusion spell or whatevs).
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        SignalSpellCastAt();

        if (!DoResistSpell(oTarget, oCaster))
        {
            ApplyAOEPersistentEffect(oTarget, EffectDarkness());
        }

        // Also do bat swarm damage regardless of what is going on with resist spell
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                ApplyDamageWithVFXToObject(oTarget, VFX_IMP_MAGBLUE, GetDiceRoll(1, 6), DAMAGE_TYPE_MAGICAL); // TODO new VFX for the bat swarm damage

                // Also save or nauseated
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_NAUSEA))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, 11, SAVING_THROW_TYPE_DISEASE))
                    {
                        ApplySpecialEffect(oTarget, SPELL_EFFECT_NAUSEA, RoundsToSeconds(1));
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // Do bat swarm damage regardless of what is going on with resist spell
        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);

                ApplyDamageWithVFXToObject(oTarget, VFX_IMP_MAGBLUE, GetDiceRoll(1, 6), DAMAGE_TYPE_MAGICAL); // TODO new VFX for the bat swarm damage

                // Also save or nauseated
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_NAUSEA))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, 11, SAVING_THROW_TYPE_DISEASE))
                    {
                        ApplySpecialEffect(oTarget, SPELL_EFFECT_NAUSEA, RoundsToSeconds(1));
                    }
                }
           }
        }
    }
    else
    {
        // Default to the normal spell script.
        if (DoSpellHook()) return;

        // We always make the spell ID consistent with SPELL_DARKNESS since
        // there are some (rather weird) engine checks related to this spell ID
        switch (nSpellId)
        {
            case SPELL_HUNGRY_DARKNESS:
                nSpellId = SPELL_DARKNESS;
            break;
            default:
            {
                // Check the spell Id for now we error and just reset it. Illusion spells shouldn't be setting this to
                // anything but Darkness.
                if (DEBUG_LEVEL >= WARNING) Warning("Somehow this script was called without the Spell Id being SPELL_DARKNESS. Setting to SPELL_DARKNESS. nSpellId: " + IntToString(nSpellId));
                nSpellId = SPELL_DARKNESS;
            }
        }

        float fDuration = GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE);

        // Destroy all existing AOEs of this type by the caster
        RemoveExistingAOEsByCaster(AOE_PER_DARKNESS, oCaster);

        effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);

        // Also apply a concentration check effect after a short delay (so it doesn't detect our current casting!). Remove the existing ones if any exist.
        RemoveEffectsFromSpell(oCaster, nSpellId);
        effect eRunScript = SupernaturalEffect(EffectRunScriptEnhanced(FALSE, "", "op_rs_concentrat", 1.0));
        DelayCommand(1.0, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eRunScript, oCaster, fDuration));
    }
}
