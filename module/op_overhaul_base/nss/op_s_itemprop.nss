//::///////////////////////////////////////////////
//:: Item Property spells
//:: op_s_itemprop
//:://////////////////////////////////////////////
/*
    Basic item property spells. There are some spells (Bless, Flame Arrow) that
    do affect items and add properties which can be funneled in here instead.

    We don't bother having a VFX cessation or anything for now. May add later.

    Continual Flame
    Light property for MAX_FLOAT temporary duration. No longer applies the Light
    spell to a creature.

    Flame Weapon
    1d6 points of fire damage.

    Blackstaff
    Quaterstaff or Magical Staff only:
    - Gives it a +4 enhancement bonus.
    - On striking a creature, dispel magic is cast on the target (caster check
      of 1d20 + 10).
    - On striking a creature, if they fail a Will save and SR check, then one
      prepared spell (or one unused spell slot, for spellcasters who do not
      prepare spells) of the highest spell level available will be unreadied
      and unavailable to cast.

*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    effect eVis;
    itemproperty ipProperty1, ipProperty2, ipProperty3;
    float fDuration;
    int nVis = VFX_INVALID;

    switch (nSpellId)
    {
        case SPELL_CONTINUAL_FLAME:
            oTarget = GetEquippableItemToCastSpellOn(oTarget, nSpellId);
            ipProperty1 = ItemPropertyLight(IP_CONST_LIGHTBRIGHTNESS_BRIGHT, IP_CONST_LIGHTCOLOR_WHITE);
            fDuration = MAX_FLOAT; // "Permanent"
        break;
        case SPELL_FLAME_WEAPON:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
            nVis = VFX_IMP_PULSE_FIRE;
            ipProperty1 = ItemPropertyVisualEffect(ITEM_VISUAL_FIRE);
            ipProperty2 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGEBONUS_1d6);
            fDuration = GetDuration(nCasterLevel, MINUTES);
        break;
        case SPELL_BLACKSTAFF:
            oTarget = GetItemToCastSpellOn(oTarget, BASE_ITEM_MAGICSTAFF, nSpellId, BASE_ITEM_QUARTERSTAFF);
            nVis = VFX_IMP_EVIL_HELP;
            ipProperty1 = ItemPropertyVisualEffect(ITEM_VISUAL_EVIL);
            ipProperty2 = ItemPropertyEnhancementBonus(4);
            ipProperty3 = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_BLACKSTAFF, nCasterLevel);
            fDuration = GetDuration(nCasterLevel, MINUTES);
        break;
    }

    if (GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
    {
        // Fire spell cast at something
        if (GetIsObjectValid(GetItemPossessor(oTarget)))
        {
            SignalSpellCastAt(GetItemPossessor(oTarget), oCaster, FALSE);
        }

        // Check we can apply the item properties
        if (GetCanApplySafeItemProperty(oTarget, ipProperty1) &&
            GetCanApplySafeItemProperty(oTarget, ipProperty2) &&
            GetCanApplySafeItemProperty(oTarget, ipProperty3))
        {
            // Apply them (but only clear effects using the first one)
            ApplySafeItemProperty(oTarget, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty3, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);

            // VFX?
            if (nVis != VFX_INVALID)
            {
                if (GetIsObjectValid(GetItemPossessor(oTarget)))
                {
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), GetItemPossessor(oTarget));
                }
                else
                {
                    ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), oTarget);
                }
            }
        }
    }
}

