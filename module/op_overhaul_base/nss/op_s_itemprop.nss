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
    1d4 points of fire damage +1 per caster level to a maximum of +10.

    Darkfire


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
            // We apply 2 damage properties, one for the random damage and one for the static damage
            ipProperty1 = ItemPropertyVisualEffect(ITEM_VISUAL_FIRE);
            ipProperty2 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_1d4);
            // Sort by caster level for the +1-10
            switch (nCasterLevel)
            {
                case 1: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_1); break;
                case 2: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_2); break;
                case 3: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_3); break;
                case 4: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_4); break;
                case 5: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_5); break;
                case 6: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_6); break;
                case 7: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_7); break;
                case 8: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_8); break;
                case 9: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_9); break;
                default: ipProperty3 = ItemPropertyDamageBonus(DAMAGE_TYPE_FIRE, IP_CONST_DAMAGEBONUS_10); break;
            }
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
            // Apply them
            ApplySafeItemProperty(oTarget, ipProperty1, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty2, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);
            ApplyItemProperty(oTarget, ipProperty3, fDuration, nSpellId, oCaster, nCasterLevel, nSpellSaveDC, nMetaMagic);

            // VFX?
            if (nVis != VFX_INVALID) ApplySpellEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(nVis), GetItemPossessor(oTarget));
        }
    }
}

