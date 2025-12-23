//:://////////////////////////////////////////////
//:: Overhaul Include: Warlock
//:: op_i_warlock
//:://////////////////////////////////////////////
/*
    Warlock include file for dealing with Eldritch blast and other aspects.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"
#include "utl_i_timer"

const string OP_WARLOCK_ESSENCE_CHOSEN = "OP_WARLOCK_ESSENCE_CHOSEN";

// Returns the DAMAGE_TYPE_* of the base warlock blast. Modified by essence.
int GetWarlockEldritchBlastDamageType(int nSpellId);

// Returns the spell Id of an essence being applied, or SPELL_INVALID if none
// are to apply.
int GetWarlockEssence(int nSpellId);

// Sets the Warlock Essence that oCaster wants to use
void SetWarlockEssence(int nSpellId, object oCaster);

// Applies the essence to oTarget
void ApplyEssenceEffect(int nSpellId, object oTarget, float fDelay);

// Does the Brimstone Blast damage. Call to do 2d6 reflex save to stop.
// Returns TRUE if the damage was not done (save successful).
int DoBrimstoneBlast(object oTarget, float fDelay = 0.0);

// Returns the DAMAGE_TYPE_* of the base warlock blast. Modified by essence.
int GetWarlockEldritchBlastDamageType(int nSpellId)
{
    switch (nSpellId)
    {
        case SPELL_HELLRIME_BLAST:
        {
            return DAMAGE_TYPE_COLD;
        }
    }
    return DAMAGE_TYPE_MAGICAL;
}

// Checks if nSpellId is a Warlock essence
int GetIsWarlockEssence(int nSpellId)
{
    // Whitelist of essences - ie we've cast this directly, now apply it
    // regardless of my general override
    switch (nSpellId)
    {
        case SPELL_DRAINING_BLAST:
        case SPELL_FRIGHTFUL_BLAST:
        case SPELL_SICKENING_BLAST:
        case SPELL_BESHADOWED_BLAST:
        case SPELL_BRIMSTONE_BLAST:
        case SPELL_HELLRIME_BLAST:
        {
            return TRUE;
        }
    }
    return FALSE;
}

// Returns the spell Id of an essence being applied, or SPELL_INVALID if none
// are to apply.
int GetAppliedWarlockEssence(int nSpellId)
{
    if (GetIsWarlockEssence(nSpellId))
    {
        return nSpellId;
    }

    // Else return the general override (it'll be validated later)
    if (GetLocalInt(oCaster, OP_WARLOCK_ESSENCE_CHOSEN))
    {
        return GetLocalInt(oCaster, OP_WARLOCK_ESSENCE_CHOSEN);
    }
    return SPELL_INVALID;
}

// Sets the Warlock Essence that oCaster wants to use
void SetWarlockEssence(int nSpellId, object oCaster)
{
    DeleteLocalInt(oCaster, OP_WARLOCK_ESSENCE_CHOSEN);

    // Check it is valid
    if (GetWarlockEssence(nSpellId) != SPELL_INVALID)
    {
        SetLocalInt(oCaster, OP_WARLOCK_ESSENCE_CHOSEN, nSpellId);
    }
    else
    {
        if (DEBUG_LEVEL >= ERROR) Error("[SetWarlockEssence] Invalid Essence Id: " + IntToString(nSpellId));
    }
}

// Applies the essence to oTarget
void ApplyEssenceEffect(int nSpellId, object oTarget, float fDelay)
{
    // Note these are applied all as their essence spell Id so they have less issues stacking
    // due to how Blasts which change the AOE and essences here can modify the spell Id.
    switch (nSpellId)
    {
        case SPELL_DRAINING_BLAST:
        {
            // Will save or slowed for 1 round
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_SLOW))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                {
                    effect eLink = GetEffectLink(EFFECT_TYPE_SLOW);
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_SLOW, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1), nSpellId));
                }
            }
        }
        break;
        case SPELL_FRIGHTFUL_BLAST:
        {
            // Will save or shaken for 1 minute (unless already shaken, won't reapply new duration or anything)
            if (!GetHasEffect(oTarget, EFFECT_TYPE_ALL, SPELL_EFFECT_SHAKEN))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_SHAKEN))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_FEAR, fDelay))
                    {
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_FEAR_S, oTarget)); // TODO new VFX (need "shaken" VFX)
                        DelayCommand(fDelay, ApplySpecialEffect(oTarget, SPELL_EFFECT_SHAKEN, TurnsToSeconds(1), nSpellId));
                    }
                }
            }
        }
        break;
        case SPELL_SICKENING_BLAST:
        {
            // Fortitude save or sickened for 1 minute.
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_SICKEN))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                {
                    effect eLink = GetEffectLink(LINK_EFFECT_SICKEN);
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DISEASE_S, oTarget)); // TODO new VFX (need "sicken" VFX)
                    DelayCommand(fDelay, ApplySpecialEffect(oTarget, SPELL_EFFECT_SICKEN, TurnsToSeconds(1), nSpellId));
                }
            }
        }
        break;
        case SPELL_BESHADOWED_BLAST:
        {
            // Fortitude or blinded for 1 round
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_BLINDNESS))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                {
                    effect eLink = GetEffectLink(EFFECT_TYPE_BLINDNESS);
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_BLIND_DEAF_M, oTarget));
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1), nSpellId));
                }
            }
        }
        break;
        case SPELL_BRIMSTONE_BLAST:
        {
            // Remove existing RunScripts to reset when the fire triggers, also
            // if we save existing effects might as well stop anyway (happens if
            // we are at between 5.1 and 6 seconds in our timer gap).
            RemoveEffectsFromSpell(oTarget, nSpellId);

            // Did we save against the damage?
            if (!DoBrimstoneBlast(oTarget, fDelay))
            {

                // The fire damage persists for 1 round per five class levels you have up to a maximum of 4 rounds at level 20.
                int nRounds =  clamp(nCasterLevel/5, 1, 4);

                effect eLink = EffectRunScriptEnhanced(FALSE, "", GetScriptName(), 6.0);
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(nRounds, ROUNDS), nSpellId));
            }
        }
        break;
        case SPELL_HELLRIME_BLAST:
        {
            // Fortitude or -4 dexterity
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_ABILITY_DECREASE))
            {
                if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_FORT, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
                {
                    // We'll remove existing castings since, while the
                    // engine won't stack the, this is considered a magical effect
                    // so we don't want to overload dispel magic
                    RemoveEffectsFromSpell(oTarget, nSpellId);

                    effect eLink = GetEffectLink(EFFECT_TYPE_ABILITY_DECREASE, ABILITY_DEXTERITY, 4);
                    DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_REDUCE_ABILITY_SCORE, oTarget)); // TODO vfx
                    DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, GetDuration(10, MINUTES), nSpellId));
                }
            }
        }
        break;
    }
}

const string OP_BRIMSTONE_BLAST_TIMER = "OP_BRIMSTONE_BLAST_TIMER";

// Does the Brimstone Blast damage. Call to do 2d6 reflex save to stop.
// Returns TRUE if the damage was not done (save successful).
int DoBrimstoneBlast(object oTarget, float fDelay = 0.0)
{
    // Timer just stops us from applying more than one at once.
    if (!GetTimerEnded(OP_BRIMSTONE_BLAST_TIMER, oTarget))
    {
        return FALSE;
    }
    SetTimer(OP_BRIMSTONE_BLAST_TIMER, 5, oTarget);
    SignalSpellCastAt();

    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_REFLEX, nSpellSaveDC, SAVING_THROW_TYPE_FIRE, fDelay))
    {
        DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_FLAME_S, GetDiceRoll(2, 6), DAMAGE_TYPE_FIRE));
        return FALSE;
    }
    return TRUE;
}

