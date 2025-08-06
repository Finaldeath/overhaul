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
#include "utl_i_timer"

void DoStorm(float fDelay);

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);
                DoStorm(0.0);
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing to remove on exit of this AOE
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        //int nCount = 1 + GetLocalInt(OBJECT_SELF, "COUNT");
        //SetLocalInt(OBJECT_SELF, "COUNT", nCount);
        //Debug("Storm of Vengence, Heartbeat Count: " + IntToString(nCount));

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_SELECTIVEHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                SetTimer(ObjectToString(oTarget), 5);
                DoStorm(GetRandomDelay(0.5, 2.0));
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_FNF_STORM, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_STORM, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(10, ROUNDS, TRUE, FALSE));
    }
}

void DoStorm(float fDelay)
{
    SignalSpellCastAt();

    if (!DoResistSpell(oTarget, oCaster))
    {
        AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_ACID_S, GetDiceRoll(6, 6), DAMAGE_TYPE_ACID)));

        int nElectricalDamage = GetDiceRoll(6, 6);

        if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_ELECTRICITY))
        {
            // We don't tag this so it lasts past the end of the AOE
            effect eLink = EffectLinkEffects(GetScaledEffect(EFFECT_TYPE_STUNNED, oTarget),
                                             EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_DISABLED),
                                                               EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            // Damage and stun
            AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_LIGHTNING_M, nElectricalDamage, DAMAGE_TYPE_ELECTRICAL)));
            AssignCommand(oCaster, DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0)));
        }
        else
        {
            // Just damage (half)
            AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_LIGHTNING_M, nElectricalDamage / 2, DAMAGE_TYPE_ELECTRICAL)));
        }
    }
}
