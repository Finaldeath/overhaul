//::///////////////////////////////////////////////
//:: Evard's Black Tentacles
//:: op_s_evardsblack
//:://////////////////////////////////////////////
/*
    Area of Effect / Target: Large, 1d4 Tentacles, + 1 / Caster Level (maximum 20)
    Duration: 1 Round / 2 Levels

    A field of thick, 10 feet long rubbery tentacles rises from the ground.
    Creatures in the area are grappled. On a successful grapple by a tentacle
    they take 1d6+4 points bludgeoning damage (as if a +2 weapon) and are held
    in place for a round.

    The inability of the tentacles to target small creatures makes all small
    creatures completely immune to the spells effects.

    Grapple checks are made with an opposed roll; caster: 1d20 + caster level
    (to a maximum of 20) + 4 (tentacle's strength modifier with 19 strength) +
    4 (tentacle' size modifier, large) vs. target: 1d20 + base attack bonus +
    strength modifier + size modifier.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

void SetTentaclesUsed(int nAmount);
int GetTentaclesLeft();
void DoTentacle(float fDelay);


void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_STANDARDHOSTILE))
        {
            SignalSpellCastAt();
            ApplyAOEPersistentEffect(oTarget, EffectMovementSpeedDecrease(50));

            // Size check
            if (GetCreatureSize(oTarget) >= CREATURE_SIZE_MEDIUM)
            {
                if (GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);

                    DoTentacle(0.0);
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Remove all AOE effects eg keeping in place.
        RemovePersistentAOEEffects(oTarget);
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_STANDARDHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            // Size check
            if (GetCreatureSize(oTarget) >= CREATURE_SIZE_MEDIUM)
            {
                if (GetTimerEnded(ObjectToString(oTarget)))
                {
                    SetTimer(ObjectToString(oTarget), 5);
                    DoTentacle(GetRandomDelay(0.1, 0.2));
                }
            }
        }
    }
    else
    {
        if (DoSpellHook()) return;

        effect eAOE = EffectAreaOfEffect(AOE_PER_EVARDS_BLACK_TENTACLES, GetScriptName(), GetScriptName(), GetScriptName());
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, GetDuration(nCasterLevel/2, ROUNDS));
    }
}

void DoTentacle(float fDelay)
{
    if (!DoResistSpell(oTarget, oCaster, fDelay, FALSE, TRUE, FALSE))
    {
        if (!DoGrapple(oTarget, oCaster, min(20, nCasterLevel), 4, 4))
        {
            // Standing around, not quite Entangle but near to it
            effect eLink = EffectLinkEffects(EffectCutsceneImmobilize(),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_EVARD_TENTACLE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE)));

            // 1d6 + 4 damage
            int nDamage = d6() + 4;
            AssignCommand(oCaster, DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_NONE, nDamage, DAMAGE_TYPE_BLUDGEONING, DAMAGE_POWER_PLUS_TWO)));
            AssignCommand(oCaster, DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, 6.0)));
        }
    }
}
