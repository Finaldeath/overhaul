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

const string OP_WARLOCK_ESSENCE_CHOSEN = "OP_WARLOCK_ESSENCE_CHOSEN";

// Returns the spell Id of an essence being applied, or SPELL_INVALID if none
// are to apply.
int GetWarlockEssence(int nSpellId);
// Sets the Warlock Essence that oCaster wants to use
void SetWarlockEssence(int nSpellId, object oCaster);
// Applies the essence to oTarget
void ApplyEssenceEffect(int nSpellId, object oTarget, float fDelay);

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
    switch (nSpellId)
    {
        case SPELL_DRAINING_BLAST:
        {
            // Will save or slowed for 1 round
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
            {
                effect eLink = GetEffectLink(EFFECT_TYPE_SLOW);
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_SLOW, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(1)));
            }
        }
        break;
        case SPELL_FRIGHTFUL_BLAST:
        {
            // Will save or shaken for 1 minute (unless already shaken, won't reapply new duration or anything)
            if (!GetHasEffect(oTarget, EFFECT_TYPE_ALL, SPELL_SHAKEN))
            {
                if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_FEAR))
                {
                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_FEAR, fDelay))
                    {
                        effect eLink = GetEffectLink(LINK_EFFECT_SHAKEN);
                        DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_FEAR_S, oTarget));
                        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(1), SPELL_SHAKEN));
                    }
                }
            }
        }
        break;
        case SPELL_SICKENING_BLAST:
        {
            // Fortitude save or sickened for 1 minute
            if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_NONE, fDelay))
            {
                effect eLink = GetEffectLink(LINK_EFFECT_SICKEN);
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DISEASE_S, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, TurnsToSeconds(1), SPELL_SICKEN));
            }
        }
        break;
    }
}
