//::///////////////////////////////////////////////
//:: Break Enchantment
//:: op_s_breakenchan.nss
//:://////////////////////////////////////////////
/*
    This spell frees creatures from enchantments, transmutations, curses, and
    petrification (as well as other magical transformations). For each such
    effect, the character makes a check of 1d20 + caster level (maximum +15)
    against a DC of 11 + caster level of the effect. Success means that the
    creature is free of the spell, curse, or effect. For cursed magic items,
    the DC is 25.

    If the spell is one that, as a special property, cannot be dispelled by
    dispel magic, break enchantment works only if that spell is of 5th level
    or lower (Innate level is used).

    If the effect comes from some permanent magic item, such as a cursed sword,
    break enchantment does not remove the curse from the item but merely frees
    the victim from the item's effects, leaving the item cursed.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Acts similar to Dispel Magic in part. Specifically it will target negative
    // effects that are:
    // * From the schools of Enchantment, Transmutation
    // Or more specific effects:
    // * Are Petrification or Curse effects
    // Currently we really do a simple dumb "RemoveEffect" and track the ID so we don't do it again

    // Max of +15 on checks
    int nCheckLevel = min(nCasterLevel, 15);

    // Max level of the targeted effect (unless not from a spell)
    int nMaxSpellLevel = 5;

    SignalSpellCastAt();

    effect eCheck = GetFirstEffect(oTarget);
    while (GetIsEffectValid(eCheck))
    {
        int nEffectType  = GetEffectType(eCheck);
        int nSpellId     = GetEffectSpellId(eCheck);
        int nCasterLevel = GetEffectCasterLevel(eCheck);
        string sID       = GetEffectLinkId(eCheck);

        // TODO ID stuff - if (sID is in array don't check again)

        // If the caster level is invalid (ie 0) we use the creators hit dice, or 25 if either exist
        if (nCasterLevel == 0 || nSpellId == SPELL_INVALID)
        {
            if (GetIsObjectValid(GetEffectCreator(eCheck)))
            {
                nCasterLevel = GetHitDice(GetEffectCreator(eCheck));
            }
            else
            {
                nCasterLevel = 25;
            }
        }

        // Simple ones: Petrification and Curse are immediately checked
        if (nEffectType == EFFECT_TYPE_PETRIFY ||
            nEffectType == EFFECT_TYPE_CURSE ||
           // Bestow Curse reuses the icon, but effects linked to it might differ
           (nEffectType == EFFECT_TYPE_ICON && GetEffectInteger(eCheck, 0) == EFFECT_ICON_CURSE))
        {
            // If it was an icon, it's now "curse" for feedback purposes
            if (nEffectType == EFFECT_TYPE_ICON) nEffectType = EFFECT_TYPE_CURSE;

            if (nSpellId == SPELL_INVALID || GetSpellLevel(nSpellId) <= nMaxSpellLevel)
            {
                // Try and break it!
                if (d20() + nCheckLevel >= 11 + nCasterLevel)
                {
                    string sBroken = "*Successfully broken enchantment of type: " + GetEffectName(eCheck) + "*";
                    SendMessageToPC(oCaster, sBroken);
                    if (oCaster != oTarget) SendMessageToPC(oTarget, sBroken);
                    RemoveEffect(oTarget, eCheck);
                }
                else
                {
                    string sBroken = "*Failed to break enchantment of type: " + GetEffectName(eCheck) + "*";
                    SendMessageToPC(oCaster, sBroken);
                    if (oCaster != oTarget) SendMessageToPC(oTarget, sBroken);
                }
            }
        }
        else if (nSpellId != SPELL_INVALID)
        {
            int nSpellSchool = GetSpellSchool(nSpellId);

            if (nSpellSchool == SPELL_SCHOOL_ENCHANTMENT ||
                nSpellSchool == SPELL_SCHOOL_TRANSMUTATION)
            {
                if (GetSpellLevel(nSpellId) <= nMaxSpellLevel)
                {
                    // For now just remove everything, good bad or whatever
                    if (d20() + nCheckLevel >= 11 + nCasterLevel)
                    {
                        string sBroken = "*Successfully broken enchantment from the spell: " + GetSpellName(nSpellId) + "*";
                        SendMessageToPC(oCaster, sBroken);
                        if (oCaster != oTarget) SendMessageToPC(oTarget, sBroken);
                        RemoveEffect(oTarget, eCheck);
                    }
                    else
                    {
                        string sBroken = "*Failed to break enchantment from the spell: " + GetSpellName(nSpellId) + "*";
                        SendMessageToPC(oCaster, sBroken);
                        if (oCaster != oTarget) SendMessageToPC(oTarget, sBroken);
                    }
                }
            }
        }
        eCheck = GetNextEffect(oTarget);
    }

    // We can also free their item curses but we've not implemented that yet
    // TODO
}
