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

        if (!DoResistSpell(oTarget, oCaster))
        {
            // Tag darkness effect and apply. Don't apply permanently due to issues
            // with players exiting the AOE when leaving a MP session. Instead
            // apply with the maximum duration we will have the AOE be around for.
            float fDuration = GetDuration(nCasterLevel, ROUNDS) + 0.5;

            effect eLink = EffectLinkEffects(EffectDarkness(),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));

            // Extraordinary so dispel magic won't remove it
            eLink = ExtraordinaryEffect(eLink);

            // Tag so we can remove it cleanly in the case of overlapping AOEs
            eLink = TagEffect(eLink, ObjectToString(OBJECT_SELF));

            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Just remove tagged effects
        RemoveEffectsFromSpell(oTarget, SPELL_DARKNESS, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));
        return;
    }

    // Default to the normal spell script.
    if (DoSpellHook()) return;

    // Set the spell Id - as noted above AOE must be of this spell ID to work right
    nSpellId = SPELL_DARKNESS;

    effect eAOE = EffectAreaOfEffect(AOE_PER_DARKNESS, "op_s_darkness", "", "op_s_darkness");
    ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS));
}

