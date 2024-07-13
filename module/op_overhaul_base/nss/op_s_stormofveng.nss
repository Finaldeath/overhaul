//::///////////////////////////////////////////////
//:: Storm of Vengeance
//:: op_s_stormofveng.nss
//:://////////////////////////////////////////////
/*
    The area around the caster is blasted by lightning and acidic rain. Each
    round, all enemies within the area of effect take 6d6 points of acid damage.
    Those who fail a Reflex save take an additional 6d6 points of electrical
    damage and are stunned for two rounds.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DoStorm();

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            // Persistent damage
            ApplyAOEPersistentRunScriptEffect(oTarget);

            DoStorm();
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all tagged effects with our OID in it as set above
        RemoveEffectsFromSpell(oTarget, nSpellId, EFFECT_TYPE_ALL, ObjectToString(OBJECT_SELF));
    }
    else if (GetLastRunScriptEffectScriptType() == RUNSCRIPT_EFFECT_SCRIPT_TYPE_ON_INTERVAL)
    {
        if (!AOECheck()) return;

        DoStorm();
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        AOECheck();
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_STORM, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_STORM, "op_s_acidfog", "op_s_acidfog", "op_s_acidfog");
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel/2, ROUNDS));
    }
}

void DoStorm()
{
    if (!DoResistSpell(oTarget, oCaster))
    {
        ApplyVisualEffectToObject(VFX_IMP_ACID_S, oTarget);
        ApplyDamageToObject(oTarget, GetDiceRoll(6, 6), DAMAGE_TYPE_ACID);

        int nElectricalDamage = GetDiceRoll(6, 6);

        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY))
        {
            // Damage and stun
            ApplyVisualEffectToObject(VFX_IMP_LIGHTNING_M, oTarget);
            ApplyDamageToObject(oTarget, nElectricalDamage, DAMAGE_TYPE_ELECTRICAL);

            effect eLink = EffectLinkEffects(EffectStunned(),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0);
        }
        else
        {
            // Just damage (half)
            ApplyVisualEffectToObject(VFX_IMP_LIGHTNING_M, oTarget);
            ApplyDamageToObject(oTarget, nElectricalDamage/2, DAMAGE_TYPE_ELECTRICAL);
        }
    }
}
