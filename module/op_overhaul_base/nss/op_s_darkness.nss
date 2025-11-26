//:://////////////////////////////////////////////
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
            ApplyAOEPersistentEffect(oTarget, EffectDarkness());
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        // Default to the normal spell script.
        if (DoSpellHook()) return;

        // Check the spell Id for now we error and just reset it. Illusion spells shouldn't be setting this to
        // anything but Darkness.
        if (nSpellId != SPELL_DARKNESS)
        {
            Debug("[op_s_darkness] Somehow this script was called without the Spell Id being SPELL_DARKNESS. nSpellId: " + IntToString(nSpellId), ERROR);
            nSpellId = SPELL_DARKNESS;
        }
        effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS, TRUE, FALSE));
    }
}
