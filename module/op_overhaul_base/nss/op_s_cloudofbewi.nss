//::///////////////////////////////////////////////
//:: Cloud of Bewilderment
//:: op_s_cloudofbewi
//:://////////////////////////////////////////////
/*
    The caster blows forth a cloud of noxious air. Creatures in the area of
    effect are dazed unless they save vs poison (being immune to mind affecting
    spells will not stop this daze). If they leave the area of effect the daze
    lasts for a further 1d4 + 1 rounds.
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

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)) && !GetHasSpellEffect(nSpellId, oTarget))
            {
                SetTimer(ObjectToString(oTarget), 5);
                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DAZED) &&
                        !GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_POISON) &&
                        GetAffectedByIllusion(oTarget) &&
                        !DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_POISON))
                    {
                        effect eLink = EffectLinkEffects(EffectDazed(),
                                                         EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

                        // Simplfied version is we apply this permanently but On Exit apply it for 1d4 + 1 more rounds
                        ApplyAOEPersistentEffect(oTarget, eLink);
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // If we have something still applied keep it going for 1d4 + 1 more rounds
        // We tag it with our OID to remove later however if they re-enter.
        if (RemovePersistentAOEEffects(oTarget))
        {
            effect eLink = EffectLinkEffects(EffectDazed(),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            // Extraordinary prevents dispel magic
            eLink = ExtraordinaryEffect(eLink);
            // Tagged with our AOE OID to remove if they trigger the OnEnter again (Won't matter if
            // this AOE just ended/was dispelled/etc.)
            eLink = TagEffect(eLink, ObjectToString(OBJECT_SELF));

            // For now applying all metamagic like Bioware did. Although this specifically doesn't have the main 2 types enabled.
            int nDuration = GetDiceRoll(1, 4, 1);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nDuration, ROUNDS));
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            // Don't save if we have the effect still
            if (GetTimerEnded(ObjectToString(oTarget)) && !GetHasSpellEffect(nSpellId, oTarget))
            {
                SetTimer(ObjectToString(oTarget), 5);

                SignalSpellCastAt();

                if (!DoResistSpell(oTarget, oCaster))
                {
                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_DAZED) &&
                        !GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_POISON) &&
                         GetAffectedByIllusion(oTarget) &&
                        !DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_POISON))
                    {
                        effect eLink = EffectLinkEffects(EffectDazed(),
                                                         EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

                        // Simplfied version is we apply this permanently but On Exit apply it for 1d4 + 1 more rounds
                        ApplyAOEPersistentEffect(oTarget, eLink);
                    }
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        ApplyVisualEffectAtLocation(VFX_IMP_DUST_EXPLOSION, lTarget);

        effect eAOE = EffectAreaOfEffect(AOE_PER_FOG_OF_BEWILDERMENT, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel, ROUNDS));
    }
}

