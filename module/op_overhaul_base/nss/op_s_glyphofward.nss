//:://////////////////////////////////////////////
//:: Glyph of Warding
//:: op_s_glyphofward
//:://////////////////////////////////////////////
/*
    The caster creates a small, magical zone that can detect the passage of
    enemy creatures. When the field is activated, it explodes, doing 1d8 points
    of sonic damage per two caster levels to all creatures within the area of
    effect (to a maximum of 5d8). After being triggered, the glyph dissipates.

    NOTE: The spell version (players use) is different from the trap version.
    However this version should be able to support firing scripts instead of
    doing the 5d8 sonic damage effect. We need a NUI panel to select what
    spell to use.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void GlyphEffect();

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        oTarget = GetEnteringObject();

        if (DEBUG_LEVEL >= INFO) Info("Glyph of Warding. Entering object: " + GetName(oTarget));

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            GlyphEffect();
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Intentionally blank
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else
    {
        // Default to the normal spell script.
        if (DoSpellHook()) return;

        // Always (even if it instantly goes off) show the warding to appear.
        ApplySpellEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_GLYPH_OF_WARDING), lTarget);

        // If fired at somewhere that has a enemy in the trigger already, we...just explode. I mean why not?
        if (GetIsTargetInAOEAtLocation(AOE_PER_GLYPH_OF_WARDING))
        {
            GlyphEffect();
            return;
        }

        // Declare major variables including Area of Effect Object
        effect eAOE = EffectAreaOfEffect(AOE_PER_GLYPH_OF_WARDING, GetScriptName(), GetScriptName(), GetScriptName());

        float fDuration = GetDuration(nCasterLevel / 2, MINUTES, TRUE, FALSE);

        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration);
    }
}

void GlyphEffect()
{
    // Blow up on ourselves if the AOE!
    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // Just in case 2 events fire pretty much the same frame we check here.
        int bDoneBlast = GetLocalInt(OBJECT_SELF, "DONE_BLAST");
        if (bDoneBlast) return;
        SetLocalInt(OBJECT_SELF, "DONE_BLAST", TRUE);
        DestroyObject(OBJECT_SELF, 0.5);
    }

    // Max 5d8 damage
    int nDamageDice = min(nCasterLevel / 2, 5);

    ApplyVisualEffectAtLocation(VFX_FNF_ELECTRIC_EXPLOSION, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetRandomDelay(0.1, 0.3);

        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            int nDamage = GetDiceRoll(nDamageDice, 8);

            // Reflex adjusted
            nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_SONIC, fDelay);

            if (nDamage > 0)
            {
                ApplyVisualEffectToObject(VFX_IMP_SONIC, oTarget);
                ApplyDamageToObject(oTarget, nDamage, DAMAGE_TYPE_SONIC);
            }
        }
    }
}
