//:://////////////////////////////////////////////
//:: Harper Feats
//:: op_f_harper
//:://////////////////////////////////////////////
/*
    Tymoras Smile

    Once per day, the harper or a target receives a +2 saving throw bonus on all
    saving throws for 5 turns. The bonus increases by 1 every 3 additional
    Harper Scout levels.

    Craft Harper Item

    Unlocks some crafting options. Opens the special harper crafting menu.
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
        case SPELL_TYMORAS_SMILE:
        {
            int nCasterLevel = GetLevelByClass(CLASS_TYPE_HARPER, oCaster);
            // +2 to saves every 3 levels past 3
            int nAmount = 2 + (2 * max(0, (nCasterLevel/3) - 1));
            float fDuration = GetDuration(5, MINUTES);

            effect eLink = EffectLinkEffects(GetEffectLink(EFFECT_TYPE_SAVING_THROW_INCREASE, SAVING_THROW_ALL, nAmount, SAVING_THROW_TYPE_ALL),
                                             EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS));
            // Special abilities should be extraordinary unlike the original script
            eLink = ExtraordinaryEffect(eLink);

            ApplyVisualEffectToObject(VFX_IMP_ELEMENTAL_PROTECTION, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
        }
        break;
        case SPELL_CRAFT_HARPER_ITEM:
        {
            ActionStartConversation(oCaster, "x1_harper", TRUE, FALSE);
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    SignalSpellCastAt();
}

