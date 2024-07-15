//::///////////////////////////////////////////////
//:: Darkness
//:: op_s_darkness
//:://////////////////////////////////////////////
/*
    Darkness spell.

    Main thing is the engine does check for SPELL_DARKNESS on the AOE effect
    oddly so we'll apply every instance of this as SPELL_DARKNESS 100% (even
    if called as an illusion spell or whatevs).

    We only apply the darkness effect, the Darkness effect itself applies
    the INVISIBILITY_TYPE_DARKNESS anyway.
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

        SignalSpellCastAt();

        if (!DoResistSpell(oTarget, oCaster))
        {
            ApplyAOEPersistentRunScriptEffect(oTarget);
            ApplyAOEPersistentEffect(oTarget, EffectDarkness());
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemoveEffectsFromSpell(oTarget, SPELL_DARKNESS, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        // Default to the normal spell script.
        if (DoSpellHook()) return;

        // Set the spell Id - as noted above AOE must be of this spell ID to work right
        nSpellId = SPELL_DARKNESS;

        effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS, "op_s_darkness", "op_s_darkness", "op_s_darkness");
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS));
    }
}

