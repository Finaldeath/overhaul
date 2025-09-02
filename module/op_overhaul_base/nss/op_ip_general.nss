//::///////////////////////////////////////////////
//:: Item Properties
//:: op_ip_general.nss
//:://////////////////////////////////////////////
/*
    General item properties used for things like Alcahol etc.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    switch (nSpellId)
    {
        case SPELL_ITEM_ALCOHOL_BEER:
        case SPELL_ITEM_ALCOHOL_WINE:
        case SPELL_ITEM_ALCOHOL_SPIRITS:
        {
            // Note: This never used to fire the OnSpellCastAt so we'll do the
            // same and ignore that SignalEvent since it keeps it consistent.

            if (Random(100) + 1 < 40)
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_TALK_LAUGHING));
            else
                AssignCommand(oTarget, ActionPlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK));

            // This is not used in the original script but might be useful to
            // re-enable at some point
            // AssignCommand(oTarget,ActionSpeakStringByStrRef(STRREF_BURP));

            // Effects based on the alcohol type
            int nValue;
            if (nSpellId == SPELL_ITEM_ALCOHOL_BEER) { nValue = 1; }
            else if (nSpellId == SPELL_ITEM_ALCOHOL_WINE) { nValue = 2; }
            else if (nSpellId == SPELL_ITEM_ALCOHOL_SPIRITS) { nValue = 3; }

            // Keep it super simple no cessation it's not a "spell"
            effect eApply = ExtraordinaryEffect(EffectAbilityDecrease(ABILITY_INTELLIGENCE, nValue));

            // TODO: Maybe have it ignore effect immunities but then you can't
            // really get drunk as a undead monster can you?
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eApply, oTarget, 60.0);
        }
        break;
        case SPELL_ITEM_BELLADONNA:
        {
            float fDuration = RoundsToSeconds(10);
            effect eLink = EffectLinkEffects(VersusRacialTypeEffect(EffectACIncrease(5), RACIAL_TYPE_SHAPECHANGER),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            // Cannot dispel item effects
            eLink = ExtraordinaryEffect(eLink);

            ApplyVisualEffectToObject(VFX_IMP_AC_BONUS, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        case SPELL_ITEM_GARLIC:
        {
            float fDuration = RoundsToSeconds(10);
            // NB: you always get bad breath, ignore any immunities!
            effect eLink = EffectLinkEffects(VersusRacialTypeEffect(EffectAttackIncrease(2), RACIAL_TYPE_UNDEAD),
                           EffectLinkEffects(IgnoreEffectImmunity(EffectAbilityDecrease(ABILITY_CHARISMA, 1)),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            // Cannot dispel item effects
            eLink = ExtraordinaryEffect(eLink);

            ApplyVisualEffectToObject(VFX_IMP_AC_BONUS, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
        default:
            Debug("[op_ip_general] No valid spell ID passed in: " + IntToString(nSpellId), ERROR);
            return;
        break;
    }
}

