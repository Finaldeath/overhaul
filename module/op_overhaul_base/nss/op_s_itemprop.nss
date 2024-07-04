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

    Blade Thirst
    +3 Enchantment Bonus on a slashing weapon, Blue VFX (for now use Cold) and
    blue light.

    Bless Weapon
    +1 Enchantment and +2d6 vs Undead

    Holy Sword
    Holy Avenger item property.

    Magic Weapon
    +1 Enchantment
    Greater Magic Weapon
    +1 / 4 caster levels (max +5).

    Magic Vestment
    +1 AC bonus per 4 caster levels (maximum of +5) armor or shield

    Keen Edge
    Piercing or Slashing weapon add the Keen item property.

    Deafening Clang
    +1 attack bonus and a +3 sonic damage bonus, defening clang On Hit spell.
    Sonic VFX.


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
    itemproperty ipProperty1, ipProperty2, ipProperty3, ipProperty4;
    float fDuration;
    int nVis = VFX_INVALID, bSpecialVFX = FALSE;

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
        case SPELL_BLADE_THIRST:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId, DAMAGE_TYPE_SLASHING);
            nVis = VFX_IMP_SUPER_HEROISM;
            ipProperty1 = ItemPropertyVisualEffect(ITEM_VISUAL_COLD); // TODO Update VFX
            ipProperty2 = ItemPropertyEnhancementBonus(3);
            ipProperty3 = ItemPropertyLight(IP_CONST_LIGHTBRIGHTNESS_BRIGHT, IP_CONST_LIGHTCOLOR_BLUE);
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        break;
        case SPELL_BLESS_WEAPON:
            // Two choices for target: Directly targeting some bolts, or targeting a melee weapon
            if (GetBaseItemType(oTarget) == BASE_ITEM_BOLT)
            {
                ipProperty1 = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_ONHIT_SLAYRAKSHASA, 1);
            }
            else
            {
                oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
                ipProperty1 = ItemPropertyVisualEffect(ITEM_VISUAL_HOLY);
                ipProperty2 = ItemPropertyEnhancementBonus(1);
                ipProperty3 = ItemPropertyDamageBonusVsRace(IP_CONST_RACIALTYPE_UNDEAD, IP_CONST_DAMAGETYPE_DIVINE, IP_CONST_DAMAGEBONUS_2d6);
            }
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        break;
        case SPELL_HOLY_SWORD:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
            ipProperty1 = ItemPropertyHolyAvenger();
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            // Apply a special VFX
            bSpecialVFX = TRUE;
        break;
        case SPELL_MAGIC_WEAPON:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
            ipProperty1 = ItemPropertyEnhancementBonus(1);
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel, MINUTES);
        break;
        case SPELL_GREATER_MAGIC_WEAPON:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
            ipProperty1 = ItemPropertyEnhancementBonus(min(5, nCasterLevel/4));
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel, HOURS);
        break;
        case SPELL_MAGIC_VESTMENT:
            oTarget = GetArmorOrShieldToCastSpellOn(oTarget, nSpellId, TRUE);
            ipProperty1 = ItemPropertyACBonus(min(5, nCasterLevel/4));
            nVis = VFX_IMP_GLOBE_USE;
            fDuration = GetDuration(nCasterLevel, HOURS);
        break;
        case SPELL_KEEN_EDGE:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId, DAMAGE_TYPE_PIERCING | DAMAGE_TYPE_SLASHING);
            ipProperty1 = ItemPropertyKeen();
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel * 10, MINUTES);
        break;
        case SPELL_DEAFENING_CLANG:
            oTarget = GetMeleeWeaponToCastSpellOn(oTarget, nSpellId);
            ipProperty1 = ItemPropertyOnHitCastSpell(IP_CONST_ONHIT_CASTSPELL_DEAFENING_CLNG, 5);
            ipProperty2 = ItemPropertyAttackBonus(1);
            ipProperty3 = ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGEBONUS_3);
            ipProperty4 = ItemPropertyVisualEffect(ITEM_VISUAL_SONIC);
            nVis = VFX_IMP_SUPER_HEROISM;
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        break;
        default:
            OP_Debug("[Item Property spells] No valid spell ID passed in: " + IntToString(nSpellId));
            return;
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
            GetCanApplySafeItemProperty(oTarget, ipProperty3) &&
            GetCanApplySafeItemProperty(oTarget, ipProperty4))
        {
            // Apply them (but only clear effects using the first one)
            ApplySafeItemProperty(oTarget, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty3, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty4, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);

            // VFX?
            object oVFXTarget = oTarget;
            if (GetIsObjectValid(GetItemPossessor(oTarget))) oVFXTarget = GetItemPossessor(oTarget);

            if (nVis != VFX_INVALID)
            {
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), oVFXTarget);
            }
            // Holy Sword
            if (bSpecialVFX)
            {
                TLVFXPillar(VFX_IMP_GOOD_HELP, GetLocation(oVFXTarget), 4, 0.0f, 6.0f);
                DelayCommand(1.0f, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_SUPER_HEROISM), GetLocation(oVFXTarget)));
            }
        }
    }
}

