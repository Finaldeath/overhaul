//:://////////////////////////////////////////////
//:: Delayed Blast Fireball
//:: op_s_delayfire
//:://////////////////////////////////////////////
/*
    The caster creates a small, magical zone that can detect the passage of
    enemy creatures. When the field is activated, it explodes, doing 1d6 points
    of fire damage per caster level to all within the area of effect, to a
    maximum of 20d6. If no enemies enter it will explode after the chosen
    number of rounds.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void DelayedBlastEffect();

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER)
    {
        if (!AOECheck()) return;

        oTarget = GetEnteringObject();

        if (DEBUG_LEVEL >= INFO) Info("Delayed Fireball Blast. Entering object: " + GetName(oTarget));

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            DelayedBlastEffect();
        }
        return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // Get count and increment until we reach the right number of rounds to explode
        int nCount = GetLocalInt(OBJECT_SELF, "COUNT");
        nCount++;
        SetLocalInt(OBJECT_SELF, "COUNT", nCount);
        int nMaxCount;
        switch (nSpellId)
        {
            case SPELL_DELAYED_BLAST_FIREBALL_1_ROUND: nMaxCount = 1; break;
            case SPELL_DELAYED_BLAST_FIREBALL_2_ROUNDS: nMaxCount = 2; break;
            case SPELL_DELAYED_BLAST_FIREBALL_3_ROUNDS: nMaxCount = 3; break;
            case SPELL_DELAYED_BLAST_FIREBALL_4_ROUNDS: nMaxCount = 4; break;
            case SPELL_DELAYED_BLAST_FIREBALL_5_ROUNDS: nMaxCount = 5; break;
        }

        if (DEBUG_LEVEL >= INFO) Info("Delayed Fireball Blast. Heartbeat. Count: " + IntToString(nCount) + " Max Count: " + IntToString(nMaxCount));

        if (nCount >= nMaxCount)
        {
            DelayedBlastEffect();
        }
        return;
    }
    else
    {
        // Default to the normal spell script.
        if (DoSpellHook()) return;

        // If fired at somewhere that has a enemy in the trigger already, we...just explode. I mean why not?
        if (GetIsTargetInAOEAtLocation(AOE_PER_DELAY_BLAST_FIREBALL))
        {
            DelayedBlastEffect();
            return;
        }

        // Declare major variables including Area of Effect Object
        effect eAOE = EffectAreaOfEffect(AOE_PER_DELAY_BLAST_FIREBALL, GetScriptName(), GetScriptName(), GetScriptName());

        // Duration depends on the subspell chosen, no Metamagic.
        float fDuration;

        switch (nSpellId)
        {
            case SPELL_DELAYED_BLAST_FIREBALL_1_ROUND: fDuration = 6.0; break;
            case SPELL_DELAYED_BLAST_FIREBALL_2_ROUNDS: fDuration = 12.0; break;
            case SPELL_DELAYED_BLAST_FIREBALL_3_ROUNDS: fDuration = 18.0; break;
            case SPELL_DELAYED_BLAST_FIREBALL_4_ROUNDS: fDuration = 24.0; break;
            case SPELL_DELAYED_BLAST_FIREBALL_5_ROUNDS: fDuration = 30.0; break;
            default:
            {
                if (DEBUG_LEVEL >= ERROR) Error("[ERROR] Delayed Blast Fireball: Invalid subspell selected.");
                return;
            }
            break;
        }

        // Add 10.0 seconds so the last heartbeat fires properly.
        ApplySpellEffectAtLocation(DURATION_TYPE_TEMPORARY, eAOE, lTarget, fDuration + 10.0);
    }
}

void DelayedBlastEffect()
{
    // Blow up on ourselves if the AOE!
    if (GetObjectType(OBJECT_SELF) == OBJECT_TYPE_AREA_OF_EFFECT)
    {
        // Just in case 2 events fire pretty much the same frame we check here.
        int bDoneBlast = GetLocalInt(OBJECT_SELF, "DONE_BLAST");
        if (bDoneBlast)
        {
            DestroyObject(OBJECT_SELF);
            return;
        }
        SetLocalInt(OBJECT_SELF, "DONE_BLAST", TRUE);

        lTarget = GetLocation(OBJECT_SELF);
    }

    // Max 20d6 damage
    int nDamageDice = min(nCasterLevel, 20);

    int nVis = VFX_IMP_FLAME_M;

    ApplyVisualEffectAtLocation(VFX_FNF_FIREBALL, lTarget);

    json jArray = GetArrayOfTargets(SPELL_TARGET_STANDARDHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE | OBJECT_TYPE_DOOR | OBJECT_TYPE_PLACEABLE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetRandomDelay(0.01, 0.1);

        // Make SR check
        if (!DoResistSpell(oTarget, oCaster, fDelay))
        {
            int nDamage = GetDiceRoll(nDamageDice, 6);

            // Reflex adjusted
            nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, fDelay);

            if (nDamage > 0)
            {
                // Apply VFX impact and damage effect
                DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, DAMAGE_TYPE_FIRE));
            }
        }
    }
}
