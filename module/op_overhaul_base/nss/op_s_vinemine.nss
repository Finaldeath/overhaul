//:://////////////////////////////////////////////
//:: Vine Mine
//:: op_s_vinemine
//:://////////////////////////////////////////////
/*
    When casting vine mine, the caster must select one of the following effects
    that will be created in the targeted area:
    - entangle (as the spell)
    - hamper movement (movement speed is halved)
    - camouflage (add +4 competence bonus on Hide checks)
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

        if (nSpellId == SPELL_VINE_MINE_CAMOUFLAGE)
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_ALLALLIES))
            {
                ApplyVisualEffectToObject(VFX_IMP_HEAD_NATURE, oTarget);
                effect eLink = EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, 4),
                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
                ApplyAOEPersistentEffect(oTarget, eLink);
            }
        }
        else if (nSpellId == SPELL_VINE_MINE_HAMPER_MOVEMENT)
        {
            if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
            {
                SignalSpellCastAt();

                if (GetAffectedByIllusion(oTarget))
                {
                    if (!DoResistSpell(oTarget, oCaster))
                    {
                        ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));
                    }
                }
            }
        }
        else
        {
            if (DEBUG_LEVEL >= ERROR) Error("OnEnter invalid spell ID: " + IntToString(nSpellId));
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
        if (DoSpellHook()) return;

        effect eAOE;
        switch (nSpellId)
        {
            case SPELL_VINE_MINE_CAMOUFLAGE:
            {
                eAOE = EffectAreaOfEffect(AOE_PER_VINE_MINE_CAMOUFLAGE, GetScriptName(), GetScriptName(), GetScriptName());
            }
            break;
            case SPELL_VINE_MINE_HAMPER_MOVEMENT:
            {
                eAOE = EffectAreaOfEffect(AOE_PER_ENTANGLE, GetScriptName(), GetScriptName(), GetScriptName());
            }
            break;
            default:
            {
                if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
                return;
            }
            break;
        }
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, MINUTES));
    }
}

