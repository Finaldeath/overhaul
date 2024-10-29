//::///////////////////////////////////////////////
//:: Auras
//:: op_a_auras
//:://////////////////////////////////////////////
/*
    Difficulty Class, where applicable: 10 + 1 for every 3 HD.
    Duration, where applicable: 1 round for every 3 HD.
    Damage, where applicable: 1d6 + 1d6 for every 3 HD.

    Some creatures are able to project a 10-foot radius field of protective
    energy that has an effect on any enemies that come within range. The
    following types of Auras are available in the game:

    Aura of Cold, Aura of Fire, Aura of Lightning: Damaging auras.
    Aura of Blinding: Enemies entering the aura are blinded.
    Aura of Fear: Enemies entering the aura are stricken with fear.
    Aura of Menace: Enemies entering the aura are stricken with the effects of
        a Doom spell.
    Aura of Protection: The caster is protected as if he had a Circle of
        Protection - Evil and Globe of Invulnerability in place.
    Aura of Stunning: Enemies entering the aura are stunned.
    Aura of Unearthly Visage: The caster appears so beautiful or so ugly that
        creature entering the aura must save or die.
    Aura of the Unnatural: All animals are instantly stricken with fear.
    Miscellaneous: Tyrantfog (5-foot radius of green mist that saps the
        Constitution of all creatures within its grasp. Fortitude save at DC 13
        to resist).
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

        // Type of effect; some are damage, some are one off effect saves
        int nType = 1;

        // Duration, DC and Damage amount are standardised
        // Difficulty Class, where applicable: 10 + 1 for every 3 HD.
        // Duration, where applicable: 1 round for every 3 HD.
        // Damage, where applicable: 1d6 + 1d6 for every 3 HD.
        int nVariable = GetHitDice(oCaster)/3;
        int nDC = 10 + nVariable;
        float fDuration = GetDuration(max(1, nVariable), ROUNDS);
        int nDamage = GetDiceRoll(1 + nVariable, 6);

        effect eLink;
        int nSavingThrow;
        int nVis = VFX_NONE;
        int nImmunity = IMMUNITY_TYPE_NONE;

        // Effect depends on the ability
        switch (nSpellId)
        {
            case SPELLABILITY_AURA_BLINDING:
            {
                nSavingThrow = SAVING_THROW_WILL;
                nImmunity = IMMUNITY_TYPE_BLINDNESS;
                nVis = VFX_IMP_BLIND_DEAF_M;
                eLink = EffectLinkEffects(EffectBlindness(),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
            }
            break;
            case SPELLABILITY_AURA_COLD:
            {

            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {

            }
            break;
            case SPELLABILITY_AURA_FEAR:
            {

            }
            break;
            case SPELLABILITY_AURA_FIRE:
            {

            }
            break;
            case SPELLABILITY_AURA_HORRIFICAPPEARANCE:
            {

            }
            break;
            case SPELLABILITY_AURA_MENACE:
            {

            }
            break;
            case SPELLABILITY_AURA_OF_COURAGE:
            {

            }
            break;
            case SPELLABILITY_AURA_PROTECTION:
            {

            }
            break;
            case SPELLABILITY_AURA_STUN:
            {

            }
            break;
            case SPELLABILITY_AURA_UNEARTHLY_VISAGE:
            {

            }
            break;
            case SPELLABILITY_AURA_UNNATURAL:
            {

            }
            break;
        }

        // Supernatural auras
        eLink = SupernaturalEffect(eLink);

        if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
        {
            SignalSpellCastAt();

            // NB we set a variable to sort the "has saved" part. We will
            // simply reuse this if they enter again.
            int nSaveResult = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));

            if (nSaveResult == SAVE_NOT_DONE_YET)
            {
                // Set we've saved (2) now and reset to 1 if not saved further down
                int nSavedResult = SAVE_RESULT_PASSED;

                if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                {
                    if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nDC))
                    {
                        ApplyVisualEffectToObject(nVis, oTarget);
                        ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

                        nSavedResult = SAVE_RESULT_FAILED;
                    }
                }
                SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), nSavedResult);
            }
            // Failed, no need to do anything
            else if (nSaveResult == SAVE_RESULT_FAILED)
            {
                // Do nothing
            }
            // 2 = resisted/saved already
            else if (nSaveResult == SAVE_RESULT_PASSED)
            {
                SendMessageToPC(oTarget, "*You previously saved and so are immune to this stinking cloud*");
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing needed
    }
    else
    {
        if (DoSpellHook()) return;

        int nAOE;
        switch (nSpellId)
        {
            case SPELLABILITY_AURA_BLINDING:
            {
                nAOE = AOE_MOB_BLINDING;
            }
            break;
            case SPELLABILITY_AURA_COLD:
            {

            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {

            }
            break;
            case SPELLABILITY_AURA_FEAR:
            {

            }
            break;
            case SPELLABILITY_AURA_FIRE:
            {

            }
            break;
            case SPELLABILITY_AURA_HORRIFICAPPEARANCE:
            {

            }
            break;
            case SPELLABILITY_AURA_MENACE:
            {

            }
            break;
            case SPELLABILITY_AURA_OF_COURAGE:
            {

            }
            break;
            case SPELLABILITY_AURA_PROTECTION:
            {

            }
            break;
            case SPELLABILITY_AURA_STUN:
            {

            }
            break;
            case SPELLABILITY_AURA_UNEARTHLY_VISAGE:
            {

            }
            break;
            case SPELLABILITY_AURA_UNNATURAL:
            {

            }
            break;
        }

        // Undispellable and lasts through resting
        effect eAOE = SupernaturalEffect(EffectAreaOfEffect(nAOE, GetScriptName(), GetScriptName(), GetScriptName()));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAOE, oTarget);
    }
}

