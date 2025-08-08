//::///////////////////////////////////////////////
//:: Terrifying Rage Aura
//:: op_f_terrifyrage.nss
//:://////////////////////////////////////////////
/*
    While the barbarian is raging, any enemy that comes close to him must make
    a Will save opposed by the barbarian's Intimidate skill + 1d10, or fears the
    barbarian for 1d3 rounds. Opponents with up to twice the barbarian's Hit
    Dice will not flee but will receive a -2 penalty to attack and saving throw
    rolls. Creatures with at least twice the barbarian's Hit Dice are not
    affected by the rage.

    Changes from base game:
    * Not paralysis anymore, actually fear!
    * Can only be tested once like other fear aura cases
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (!AOECheck()) return;

    if (GetSpellTargetValid(oTarget, oCaster, SPELL_TARGET_SELECTIVEHOSTILE))
    {
        SignalSpellCastAt();


        effect eLink = EffectLinkEffects(EffectDazed(),
                                         EffectVisualEffect(VFX_DUR_MIND_AFFECTING_NEGATIVE));

        // DC = Intimidate + 1d10
        nSpellSaveDC = GetSkillRank(SKILL_INTIMIDATE, oCaster) + d10(1);

        // Only affects those with less than or equal to Hit Dice * 2
        // A level 50 creature is affected by a level 25 barbarian, a level 51 is not.
        if (GetHitDice(oTarget) <= GetHitDice(oCaster) * 2)
        {
            if (!GetIsImmuneWithFeedback(oTarget, oCaster, IMMUNITY_TYPE_FEAR))
            {
                // NB we set a variable to sort if we've saved at least once (if they're fear immune once they might not be in a second entering)
                int bSaveChecked = GetLocalInt(OBJECT_SELF, ObjectToString(oTarget));
                if (!bSaveChecked)
                {
                    // Set we've tested
                    SetLocalInt(OBJECT_SELF, ObjectToString(oTarget), TRUE);

                    if (!DoSavingThrow(oTarget, oCaster, SAVING_THROW_WILL, nSpellSaveDC, SAVING_THROW_TYPE_FEAR))
                    {
                        // Hit dice below barb.... run like hell!
                        if (GetHitDice(oTarget) < GetHitDice(oCaster))
                        {
                            // Scaled effect
                            effect eLink = ExtraordinaryEffect(GetEffectLink(EFFECT_TYPE_FRIGHTENED, oTarget));

                            // Help!
                            PlayVoiceChat(VOICE_CHAT_HELP,  oTarget);

                            float fDuration = GetScaledDuration(oTarget, d3(), ROUNDS);

                            ApplyVisualEffectToObject(VFX_IMP_FEAR_S, oTarget);
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                        }
                        // Up to twice the barbs HD ... shaken
                        else
                        {
                            effect eLink = ExtraordinaryEffect(GetEffectLink(LINK_EFFECT_SHAKEN));

                            FloatingTextStrRefOnCreature(STRREF_TREMBLING_WITH_FEAR, oTarget); // * trembling with fear! *

                            float fDuration = GetDuration(d3(), ROUNDS);

                            ApplyVisualEffectToObject(VFX_IMP_FEAR_S, oTarget);
                            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
                        }
                    }
                }
                else
                {
                    SendMessageToPC(oTarget, "*You previously tested and so are immune to this creatures terrifying rage*");
                }
            }
        }
    }
}

