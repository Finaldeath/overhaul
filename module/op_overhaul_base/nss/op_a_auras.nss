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
    Aura of Fear and Dragon Fear: Enemies entering the aura are stricken with fear.
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
#include "utl_i_timer"

void main()
{
    if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_ENTER ||
        GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_HEARTBEAT)
    {
        if (!AOECheck()) return;

        // Duration, DC and Damage amount are standardised
        // Difficulty Class, where applicable: 10 + 1 for every 3 HD.
        // Duration, where applicable: 1 round for every 3 HD.
        // Damage, where applicable: 1d6 + 1d6 for every 3 HD.
        int nVariable = GetHitDice(oCaster)/3;
        int nDC = 10 + nVariable;
        int nDuration = max(1, nVariable);
        int nDurationType = ROUNDS;
        int bScaledEffect = FALSE;
        int nDamageType, nDamage = 0;

        effect eLink;
        effect eBaseEffect;
        int nSavingThrow = SAVING_THROW_NONE, nSavingThrowType = SAVING_THROW_TYPE_NONE;
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
                // (1 + 1/3 level)d4
                nDamage = GetDiceRoll(1 + nVariable, 4);
                nDamageType = DAMAGE_TYPE_COLD;
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_COLD;
                nVis = VFX_IMP_FROST_S;
            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {
                // (1 + 1/3 level)d4
                nDamage = GetDiceRoll(1 + nVariable, 4);
                nDamageType = DAMAGE_TYPE_ELECTRICAL;
                nSavingThrow = SAVING_THROW_FORT;
                nSavingThrowType = SAVING_THROW_TYPE_ELECTRICITY;
                nVis = VFX_IMP_LIGHTNING_S;
            }
            break;
            case SPELLABILITY_DRAGON_FEAR:
            {
                nDC = 10 + (GetHitDice(oCaster)/2) + GetAbilityModifier(ABILITY_CHARISMA, oCaster);
                nDuration = min(20, GetHitDice(oCaster));

                // From Bioware's script for XP3 I think:
                // Yaron does not like the stunning beauty of a very specific dragon to
                // last more than 10 rounds ....
                if (GetTag(GetAreaOfEffectCreator()) == "q3_vixthra")
                {
                    nDuration = 3 + d6();
                }

                eLink = EffectLinkEffects(EffectFrightened(),
                                          EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
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
            case SPELLABILITY_TROGLODYTE_STENCH:
            {

            }
            break;
            default:
            {
                Debug("[op_s_auras] IMPACT AREA: No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            }
            break;
        }

        // Supernatural auras
        eLink = SupernaturalEffect(eLink);

        json jArray = GetArrayOfAOETargets(SPELL_TARGET_SELECTIVEHOSTILE);
        int nIndex;
        for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
        {
            oTarget = GetArrayObject(jArray, nIndex);

            SignalSpellCastAt();

            if (GetTimerEnded(ObjectToString(oTarget)))
            {
                // If we have damage we just do it (5 second timer)
                if (nDamage > 0)
                {
                    SetTimer(ObjectToString(oTarget), 5);

                    nDamage = DoDamageSavingThrow(nDamage, oTarget, oCaster, nSavingThrow, nDC, nSavingThrowType);

                    if (nDamage > 0) ApplyDamageWithVFXToObject(oTarget, nVis, nDamage, nDamageType);
                }
                else
                {
                    // Else we set a timer for 24 hours so we don't trigger it again
                    SetTimer(ObjectToString(oTarget), 24 * 60 * 60);

                    if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunity))
                    {
                        if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nDC, nSavingThrowType))
                        {
                            ApplyVisualEffectToObject(nVis, oTarget);
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                        }
                    }
                }
            }
        }
    }
    else if (GetCurrentlyRunningEvent() == EVENT_SCRIPT_AREAOFEFFECT_ON_OBJECT_EXIT)
    {
        // Nothing needed really all effects are temporary not based on being in the AOE
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
                nAOE = AOE_MOB_FROST;
            }
            break;
            case SPELLABILITY_AURA_ELECTRICITY:
            {
                nAOE = AOE_MOB_ELECTRICAL;
            }
            break;
            case SPELLABILITY_DRAGON_FEAR:
            {
                nAOE = AOE_MOB_DRAGON_FEAR;
            }
            break;
            case SPELLABILITY_AURA_FEAR:
            {
                nAOE = AOE_MOB_FEAR;
            }
            break;
            case SPELLABILITY_AURA_FIRE:
            {
                nAOE = AOE_MOB_FIRE;
            }
            break;
            case SPELLABILITY_AURA_HORRIFICAPPEARANCE:
            {
                nAOE = AOE_MOB_HORRIFICAPPEARANCE;
            }
            break;
            case SPELLABILITY_AURA_MENACE:
            {
                nAOE = AOE_MOB_MENACE;
            }
            break;
            case SPELLABILITY_AURA_PROTECTION:
            {
                nAOE = AOE_MOB_PROTECTION;
            }
            break;
            case SPELLABILITY_AURA_STUN:
            {
                nAOE = AOE_MOB_STUN;
            }
            break;
            case SPELLABILITY_AURA_UNEARTHLY_VISAGE:
            {
                nAOE = AOE_MOB_UNEARTHLY;
            }
            break;
            case SPELLABILITY_AURA_UNNATURAL:
            {
                nAOE = AOE_MOB_UNNATURAL;
            }
            break;
            case SPELLABILITY_TROGLODYTE_STENCH:
            {
                nAOE = AOE_MOB_TROGLODYTE_STENCH;
            }
            break;
            default:
            {
                Debug("[op_s_auras] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
                return;
            }
            break;
        }

        // Undispellable and lasts through resting
        effect eAOE = SupernaturalEffect(EffectAreaOfEffect(nAOE, GetScriptName(), GetScriptName(), GetScriptName()));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAOE, oTarget);
    }
}

