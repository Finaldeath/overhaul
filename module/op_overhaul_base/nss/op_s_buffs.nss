//:://////////////////////////////////////////////
//:: Buffing spells
//:: op_s_buffs
//:://////////////////////////////////////////////
/*
    Various buff spells throw them all in this huge file. They have a set
    duration, affect either the target creature or allies in an area, and
    generally apply one visual and one linked set of buff effects nothing
    too complicated (like mobile AOEs or affecting enemies with things).

    Removes existing castings of that specific spell. Some spells may remove
    other ones of the same type.

    Undeaths Eternal Foe
    All allies in the area of effect will receive the following bonuses: +100%
    immunity to negative damage, immunity to death magic, immunity to
    level/energy drain, immunity to ability score decreases, immunity to fear,
    immunity to poisons, immunity to diseases and a +4 deflection bonus to AC.

    Mage Armor
    +4 AC enchantment bonus.

    Greater Mage Armor
    +6 AC enchantment bonus.

    Epic Mage Armor
    Specifics: The caster gets a +20 armor AC enchantment bonus 1 hour/level.

    True Strike
    +20 to hit for 9 seconds.

    Bless
    +1 attack and +1 will save vs. fear, for 1 minute/level to allies in area.

    Divine Favour
    +1 attack and weapon damage (not magical!) per 3 levels, max +3. 1 minute.

    Ghostly Visage
    Damage reduction 5/+1, prevents all spells of level 1 or lower from
    affecting the caster, and grants 10% concealment. 1 minute/level.

    Ethereal Visage
    Damage reduction 20/+3, prevents all spells of level 2 or lower from
    affecting the caster and provides a 25% concealment bonus. 1 round/level.

    Shadow Shield
    +5 natural AC bonus, 10 / +3 Damage reduction, Immunity to instant death
    effects, Immunity to Necromancy spells, +100% Immunity to Negative Energy
    Damage. 1 round/level.

    Death Ward
    Immunity to death magic. 1 hour/level.

    Aura of Vitality
    +4 Str, Dex, Con for allies, max 1 ally/3 levels. 1 round/level.

    Barkskin
    Natural AC bonus: Level 1-6: +3, Level 7-12: +4, Levels 13+: +5. 1 hour/level.

    Blood Frenzy
    The caster gains a +2 bonus to Strength and Constitution and a +1 bonus to
    Will saves, while suffering a -1 penalty to AC.

    The Ability Score Buffs
    1d4 + 1 or 2d4 + 1 (Greater version) or Caster Level / 2 (Owl's Insight)
    bonus to ability score. Removes previous. 1 hour/level.

    Awaken
    Animal gains +4 Strength, +4 Constitution, +1d10 Wisdom, and +2 to attack
    rolls. 1 hour/level.

    Clairaudience/Clairvoyance
    +10 bonus to all Spot and Listen checks. 1 round/level.

    Expeditious Retreat
    +50% move speed for 1 minute/level. Cannot be applied if hasted.

    Haste / Mass Haste
    Haste for 1 round/level. (Mass haste max Caster Level in creatures affected)

    Resistance
    Grants the target creature a +1 bonus to all saving throws. 2 minutes.

    Major Resistance
    +3 to saves. 1 hour/level.

    Superior Resistance
    +6 to saves. 1 hour/level.

    Protection from Spells
    Within the area of effect, up to one ally per 4 caster levels receives a
    +8 bonus on all saving throws against spells. 1 minute/level.

    Death Armor
    1d4 + 1/2 caster levels negative damage. 1 round/level.

    Wounding Whispers
    1d6 + 1 / level sonic damage. 1 round/level.

    Elemental Shield
    1d6 + 1 / level fire damage. 50% immunity to fire and cold. 1 round/level.

    Mestil's Acid Sheath
    1d6 + 1 / level acid damage, 50% immunity to acid. 1 round/level.

    Stoneskin
    10/+5 damage reduction for up to a limit of 10 per caster level, 100 limit. 1 hour/level.

    Greater Stoneskin
    20/+5 damage reduction for up to a limit of 10 per caster level, 150 limit. 1 hour/level.

    Premonition
    30/+5 damage reduction for up to a limit of 10 per caster level, no limit. 1 hour/level.

    Epic Warding
    50/+20 damage reduction for 1 round per level.

    Blur
    The subject's outline appears blurred. This distortion grants the subject
    20% concealment. 1 minute/level.

    Entropic Shield
    A magical field appears around the caster, causing any nearby enemies a
    20% chance to miss on ranged attacks. 1 minute/level.

    Displacement
    The target gains 50% concealment, displacing the caster's image several feet
    to the side, similar to the abilities of a displacer beast. 1 round/level.

    Spell Resistance
    12 + 1/caster level SR. 1 minute/level.

    Mass Spell Resistance
    12 +1 caster level to 1 ally/2 levels in the area. 1 minute/level.

    Endure Elements
    10/- against 20 points of damage. 1 minute/level.

    Resist Elements
    20/- against 30 points of damage. 1 minute/level.

    Protection from Elements
    30/- against 40 points of damage. 1 minute/level.

    Energy Buffer
    40/- against 60 points of damage. 1 minute/level.

    Lesser Spell Mantle
    Absorb 1d4 + 6 spells. 1 round/level.

    Spell Mantle
    Absorb 1d8 + 8 spells. 1 round/level.

    Greater Spell Mantle
    Absorb 1d12 + 10 spells. 1 round/level.

    Darkvision
    EffectBonusFeat(FEAT_DARKVISION) plus +5 to spot. 1 Hour/Level.

    Ultravision
    EffectUltravision. 1 Hour/Level.

    See Invisibility
    EffectSeeInvisible. 1 minute/level.

    True Seeing
    EffectTrueSeeing. 1 minute/level.

    Minor Globe of Invulnerability
    A shimmering field of energy prevents all spells of level 3 or lower
    from affecting the caster. 1 round/level.

    Globe of Invulnerability
    A shimmering field of energy prevents all spells of level 4 or lower
    from affecting the caster. 1 round/level.

    Invisibility
    Invisibility, 1 minute/level.

    Improved Invisibility
    Invisibility and 50% concealment, 1 minute/level.

    Iron Body
    Lots of bonuses and several penalties at once. 1 minute/level.

    Aura of Glory
    The caster channels divine power to gain a +4 charisma bonus. All allies
    near the caster gain a +5 bonus to their saving throws versus fear and are
    healed of 1d4 damage (constructs and undead are not healed).

    Ethereal Jaunt (renamed Greater Sanctuary)
    The caster becomes ethereal. No other creature can detect the caster.
    Attacking or performing a hostile action will make the etherealness vanish.

    One with the Land
    The caster forges a strong link with nature, gaining a +4 bonus to Animal
    Empathy, Hide, Move Silently, and Set Trap skills.

    Stone Bones
    You cause the target corporeal undead to gain a +3 natural armor class
    bonus, due to the thickening of its bones.

    Sanctuary
    The caster's or the person's, touched by the caster, presence is completely
    ignored by nearby creatures for the duration of the spell.

    Negative Energy Protection
    The target creature is rendered immune to all ability damage and level
    drains and gains 100% increased immunity to negative damage.

    Shield
    The caster gains a +4 deflection bonus to AC. As well, the caster is
    immune to the spell magic missile for the duration of the shield.

    Ironguts
    When touched, the target creature gains a +5 circumstance bonus on
    Fortitude saves against all poisons.

    ----

    Divine Protection
    Available to Clerics of the Protection Domain. The cleric is able to cast
    an improved form of Sanctuary that sets the save DC at 10 + Chr Modifier +
    Clerical Level. The effect has a duration of 1 round per Cleric level +
    Charisma modifier.

    Divine Strength
    Available to Clerics of the Strength Domain. The cleric gains a bonus to
    Strength equal to 2 + 1 per 3 class levels. This effect has a duration of
    5 turns + the cleric's Charisma modifier.

    Divine Trickery
    Available to Clerics of the Trickery Domain. Bonus to Hide, Persuade,
    Search, Disable Trap, Move Silently, Open Lock, Pick Pockets, and Hide
    checks equal to the 1 per 2 levels. This effect lasts for 5 turns + the
    cleric's Charisma modifier.

    Battle Mastery
    The clerics gains a bonus of 1 + 1 per 5 levels to Dexterity, Constitution,
    Attack Rolls and Damage. As well the cleric receives double this value as
    damage reduction. The effect will last for 5 rounds + charisma modifer.

    Mummy Bolster Undead
    All allies in area gain +(HD/4) Turn Resistance bonus.

    Haste-Slow
    The target of this spell is either hasted (66%) or slowed (33%).

    Shadowblend
    The creature is able to blend into shadows, gaining 90% concealment.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    // Toggles
    int bDelayRandom = FALSE;
    int nImpact = VFX_NONE, nVis = VFX_NONE;
    int nRemoveSpell1 = SPELL_INVALID, nRemoveSpell2 = SPELL_INVALID, nRemoveSpell3 = SPELL_INVALID, nRemoveSpell4 = SPELL_INVALID;
    int nCreatureLimit = 99999;
    effect eLink;
    float fDuration;

    // This is enabled for things like Improved Invisibility
    int bSecondLink = FALSE;
    effect eSecondLink;

    int nHealDice = 0, nHealDiceSize = 0, nHealBase = 0;
    int bApplyToTarget = TRUE;

    switch (nSpellId)
    {
        case SPELL_UNDEATHS_ETERNAL_FOE:
        {
            nImpact   = VFX_FNF_LOS_HOLY_30;
            nVis      = VFX_IMP_HOLY_AID;
            eLink     = EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100),
                                          EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_NEGATIVE_LEVEL),
                                                            EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_ABILITY_DECREASE),
                                                                              EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_POISON),
                                                                                                EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DISEASE),
                                                                                                                  EffectACIncrease(4, AC_DEFLECTION_BONUS))))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_MAGE_ARMOR:
        {
            nVis      = VFX_IMP_AC_BONUS;
            eLink     = EffectLinkEffects(EffectACIncrease(4, AC_ARMOUR_ENCHANTMENT_BONUS),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            nRemoveSpell1 = SPELL_GREATER_MAGE_ARMOR;
        }
        break;
        case SPELL_GREATER_MAGE_ARMOR:
        {
            nVis      = VFX_IMP_AC_BONUS;
            eLink     = EffectLinkEffects(EffectACIncrease(6, AC_ARMOUR_ENCHANTMENT_BONUS),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            nRemoveSpell1 = SPELL_MAGE_ARMOR;
        }
        break;
        case SPELL_EPIC_MAGE_ARMOR:
        {
            // Need to rework the DUR VFX model properly and have a VIS version added
            // since the current version is used for Epic Warding. Perhaps do some recolouring.
            nVis  = VFX_DUR_PROT_EPIC_ARMOR;
            eLink = EffectLinkEffects(EffectACIncrease(20, AC_ARMOUR_ENCHANTMENT_BONUS),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            // Cannot be dispelled but lost on rest
            eLink     = ExtraordinaryEffect(eLink);
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_TRUE_STRIKE:
        {
            nVis      = VFX_IMP_HEAD_ODD;
            eLink     = EffectLinkEffects(EffectAttackIncrease(20),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = 9.0;
        }
        break;
        case SPELL_BLESS:
        {
            // Special case: Blessed Bolts
            if (GetIsObjectValid(oTarget) && GetObjectType(oTarget) == OBJECT_TYPE_ITEM)
            {
                FireItemPropertySpellScript();
                return;
            }
            nImpact   = VFX_FNF_LOS_HOLY_30;
            nVis      = VFX_IMP_HEAD_HOLY;
            eLink     = EffectLinkEffects(EffectAttackIncrease(1),
                                          EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1, SAVING_THROW_TYPE_FEAR),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_DIVINE_FAVOR:
        {
            nVis = VFX_IMP_HEAD_HOLY;

            int nBonus = clamp(nCasterLevel / 3, 1, 3);
            int nDamageBonus;
            switch (nBonus)
            {
                case 1: nDamageBonus = DAMAGE_BONUS_1; break;
                case 2: nDamageBonus = DAMAGE_BONUS_2; break;
                case 3: nDamageBonus = DAMAGE_BONUS_3; break;
            }
            // Physical damage bonus not magical
            eLink     = EffectLinkEffects(EffectAttackIncrease(nBonus),
                                          EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(1, MINUTES);
        }
        break;
        case SPELL_GHOSTLY_VISAGE:
        {
            eLink     = EffectLinkEffects(EffectDamageReduction(5, DAMAGE_POWER_PLUS_ONE),
                                          EffectLinkEffects(EffectSpellLevelAbsorption(1),
                                                            EffectLinkEffects(EffectConcealment(10),
                                                                              EffectLinkEffects(EffectVisualEffect(VFX_DUR_GHOSTLY_VISAGE),
                                                                                                EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_ETHEREAL_VISAGE:
        {
            eLink     = EffectLinkEffects(EffectDamageReduction(20, DAMAGE_POWER_PLUS_THREE),
                                          EffectLinkEffects(EffectSpellLevelAbsorption(2),
                                                            EffectLinkEffects(EffectConcealment(25),
                                                                              EffectLinkEffects(EffectVisualEffect(VFX_DUR_ETHEREAL_VISAGE),
                                                                                                EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_SHADOW_SHIELD:
        {
            nVis      = VFX_IMP_DEATH_WARD;
            eLink     = EffectLinkEffects(EffectDamageReduction(10, DAMAGE_POWER_PLUS_THREE),
                                          EffectLinkEffects(EffectACIncrease(5, AC_NATURAL_BONUS),
                                                            EffectLinkEffects(EffectSpellLevelAbsorption(9, 0, SPELL_SCHOOL_NECROMANCY),
                                                                              EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DEATH),
                                                                                                EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100),
                                                                                                                  EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR),
                                                                                                                                    EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_DEATH_WARD:
        {
            nVis      = VFX_IMP_DEATH_WARD;
            eLink     = EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DEATH),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_AURA_OF_VITALITY:
        {
            // Letting this stack with other ability score increases for now
            nImpact        = VFX_FNF_NATURES_BALANCE;  // Needs unique VFX
            nVis           = VFX_IMP_IMPROVE_ABILITY_SCORE;
            nCreatureLimit = max(1, nCasterLevel / 3);
            bDelayRandom   = TRUE;
            eLink          = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 4),
                                               EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, 4),
                                                                 EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, 4),
                                                                                   EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
            fDuration      = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_BARKSKIN:
        {
            nVis       = VFX_IMP_HEAD_NATURE;
            int nBonus = 3;
            if (nCasterLevel >= 7 && nCasterLevel <= 12)
                nBonus = 4;
            else if (nCasterLevel >= 13)
                nBonus = 5;
            eLink     = EffectLinkEffects(EffectACIncrease(nBonus, AC_NATURAL_BONUS),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_BARKSKIN),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_BLOOD_FRENZY:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = 3;
            if (nCasterLevel >= 7 && nCasterLevel <= 12)
                nBonus = 4;
            else if (nCasterLevel >= 13)
                nBonus = 5;
            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 2),
                                          EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, 2),
                                                            EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_WILL, 1),
                                                                              EffectLinkEffects(IgnoreEffectImmunity(EffectACDecrease(1, AC_DODGE_BONUS)),
                                                                                                EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Special!
            PlayVoiceChat(VOICE_CHAT_BATTLECRY1);
        }
        break;
        case SPELL_BULLS_STRENGTH:
        case SPELL_GREATER_BULLS_STRENGTH:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_BULLS_STRENGTH ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_BULLS_STRENGTH;
            nRemoveSpell2 = SPELL_GREATER_BULLS_STRENGTH;
        }
        break;
        case SPELL_CATS_GRACE:
        case SPELL_GREATER_CATS_GRACE:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_CATS_GRACE ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_CATS_GRACE;
            nRemoveSpell2 = SPELL_GREATER_CATS_GRACE;
        }
        break;
        case SPELL_EAGLE_SPLEDOR:
        case SPELL_GREATER_EAGLE_SPLENDOR:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_EAGLE_SPLEDOR ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CHARISMA, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_EAGLE_SPLEDOR;
            nRemoveSpell2 = SPELL_GREATER_EAGLE_SPLENDOR;
        }
        break;
        case SPELL_ENDURANCE:
        case SPELL_GREATER_ENDURANCE:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_ENDURANCE ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_ENDURANCE;
            nRemoveSpell2 = SPELL_GREATER_ENDURANCE;
        }
        break;
        case SPELL_FOXS_CUNNING:
        case SPELL_GREATER_FOXS_CUNNING:
        {
            nVis       = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus = nSpellId == SPELL_FOXS_CUNNING ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_INTELLIGENCE, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_FOXS_CUNNING;
            nRemoveSpell2 = SPELL_GREATER_FOXS_CUNNING;
        }
        break;
        case SPELL_OWLS_WISDOM:
        case SPELL_GREATER_OWLS_WISDOM:
        case SPELL_OWLS_INSIGHT:
        {
            nVis = VFX_IMP_IMPROVE_ABILITY_SCORE;
            int nBonus;

            if (nSpellId == SPELL_OWLS_INSIGHT)
            {
                nBonus = nCasterLevel / 2;
            }
            else
            {
                nBonus = nSpellId == SPELL_OWLS_WISDOM ? GetDiceRoll(1, 4, 1) : GetDiceRoll(2, 4, 1);
            }

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_WISDOM, nBonus),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);

            // Remove previous castings
            nRemoveSpell1 = SPELL_OWLS_WISDOM;
            nRemoveSpell2 = SPELL_GREATER_OWLS_WISDOM;
            nRemoveSpell3 = SPELL_OWLS_INSIGHT;
        }
        break;
        case SPELL_AWAKEN:
        {
            if (GetRacialType(oTarget) != RACIAL_TYPE_ANIMAL)
            {
                SendMessageToPCByStrRef(oCaster, STRREF_AWAKEN_ONLY_ANIMAL_TARGETS); // *Awaken can only affect animal targets*
                return;
            }
            nVis             = VFX_IMP_HOLY_AID;
            int nRandomBonus = GetDiceRoll(1, 10);

            eLink     = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 4),
                                          EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, 4),
                                                            EffectLinkEffects(EffectAbilityIncrease(ABILITY_WISDOM, nRandomBonus),
                                                                              EffectLinkEffects(EffectAttackIncrease(2),
                                                                                                EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_CAMOFLAGE:
        case SPELL_MASS_CAMOFLAGE:
        {
            nVis      = VFX_IMP_IMPROVE_ABILITY_SCORE;  // Could use a new VFX or sound at least (hiding sound?)
            nImpact   = VFX_FNF_LOS_HOLY_30;            // For Mass version only, again new VFX?
            eLink     = EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, 10),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel * 10, MINUTES);

            nRemoveSpell1 = SPELL_CAMOFLAGE;
            nRemoveSpell2 = SPELL_MASS_CAMOFLAGE;
        }
        break;
        case SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE:
        {
            eLink     = EffectLinkEffects(EffectSkillIncrease(SKILL_SPOT, 10),
                                          EffectLinkEffects(EffectSkillIncrease(SKILL_LISTEN, 10),
                                                            EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                                                              EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_EXPEDITIOUS_RETREAT:
        {
            // Can't have haste
            if (GetHasEffectOrItemProperty(oTarget, EFFECT_TYPE_HASTE, ITEM_PROPERTY_HASTE))
            {
                SendMessageToPCByStrRef(oCaster, STRREF_EXPEDITIOUS_RETREAT_NO_HASTE); // *Expeditious Retreat cannot be cast when hasted.*
                return;
            }
            nVis      = VFX_IMP_HASTE;  // TODO New VFX
            eLink     = EffectLinkEffects(EffectMovementSpeedIncrease(50),
                                          EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "", "op_rs_checkhaste", 2.0),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_HASTE:
        case SPELL_MASS_HASTE:
        case SPELL_FEAT_BLINDING_SPEED:
        {
            nImpact        = VFX_FNF_LOS_NORMAL_30;
            nCreatureLimit = nCasterLevel;
            nVis           = VFX_IMP_HASTE;
            eLink          = GetEffectLink(EFFECT_TYPE_HASTE);
            if (nSpellId == SPELL_FEAT_BLINDING_SPEED)
            {
                fDuration = GetDuration(10, ROUNDS);
                eLink = SupernaturalEffect(eLink); // Don't dispel a feat-spell like this
            }
            else
            {
                fDuration = GetDuration(nCasterLevel, ROUNDS);
            }
            // Remove just Expeditious Retreat (and itself) since we can "stack" hastes to supress "slows"
            nRemoveSpell1 = SPELL_EXPEDITIOUS_RETREAT;
        }
        break;
        case SPELL_RESISTANCE:
        {
            nVis      = VFX_IMP_HEAD_HOLY;
            eLink     = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 1),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(2, MINUTES);
        }
        break;
        case SPELL_MAJOR_RESISTANCE:
        {
            nVis      = VFX_IMP_MAGIC_PROTECTION;
            eLink     = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 3),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_SUPERIOR_RESISTANCE:
        {
            nVis      = VFX_IMP_MAGIC_PROTECTION;
            eLink     = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 6),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
            fDuration = GetDuration(nCasterLevel, HOURS);
        }
        break;
        case SPELL_PROTECTION_FROM_SPELLS:
        {
            nImpact        = VFX_FNF_LOS_NORMAL_10;  // TODO new VFX
            nVis           = VFX_IMP_MAGIC_PROTECTION;
            eLink          = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 8, SAVING_THROW_TYPE_SPELL),
                                               EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGIC_RESISTANCE),
                                                                 EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            nCreatureLimit = max(1, nCasterLevel / 4);
            fDuration      = GetDuration(nCasterLevel, MINUTES);
        }
        break;
        case SPELL_DEATH_ARMOR:
        case SPELL_WOUNDING_WHISPERS:
        case SPELL_ELEMENTAL_SHIELD:
        case SPELL_MESTILS_ACID_SHEATH:
        {
            int nDamageType, nVFX, nImmunity1 = -1, nImmunity2 = -1;
            int nStaticDamage = nCasterLevel;
            switch (nSpellId)
            {
                case SPELL_DEATH_ARMOR:
                    nDamageType = DAMAGE_TYPE_NEGATIVE;
                    nStaticDamage /= 2;
                    if (nStaticDamage > 10) nStaticDamage = 10;
                    nVFX = VFX_DUR_DEATH_ARMOR;
                case SPELL_WOUNDING_WHISPERS:
                    nDamageType = DAMAGE_TYPE_SONIC;
                    nVFX        = VFX_DUR_MIND_AFFECTING_POSITIVE;  // Really needs a new VFX
                    break;
                case SPELL_ELEMENTAL_SHIELD:
                    nDamageType = DAMAGE_TYPE_FIRE;
                    nVFX        = VFX_DUR_ELEMENTAL_SHIELD;
                    nImmunity1  = DAMAGE_TYPE_COLD;
                    nImmunity2  = DAMAGE_TYPE_FIRE;
                    break;
                case SPELL_MESTILS_ACID_SHEATH:
                    nDamageType = DAMAGE_TYPE_ACID;
                    nVFX        = VFX_DUR_PROT_ACIDSHIELD;
                    nImmunity1  = DAMAGE_TYPE_ACID;
                    break;
            }
            eLink = EffectLinkEffects(EffectDamageShield(nStaticDamage, DAMAGE_BONUS_1d6, nDamageType),
                                      EffectLinkEffects(EffectVisualEffect(nVFX),
                                                        EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

            // Optional immunities
            if (nImmunity1 >= 0) eLink = EffectLinkEffects(eLink, EffectDamageImmunityIncrease(nImmunity1, 50));
            if (nImmunity2 >= 0) eLink = EffectLinkEffects(eLink, EffectDamageImmunityIncrease(nImmunity2, 50));

            nRemoveSpell1 = SPELL_DEATH_ARMOR;
            nRemoveSpell2 = SPELL_WOUNDING_WHISPERS;
            nRemoveSpell3 = SPELL_ELEMENTAL_SHIELD;
            nRemoveSpell4 = SPELL_MESTILS_ACID_SHEATH;

            fDuration = GetDuration(nCasterLevel, ROUNDS);
        }
        break;
        case SPELL_STONESKIN:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis      = VFX_IMP_SUPER_HEROISM;
            eLink     = EffectLinkEffects(EffectDamageReduction(10, DAMAGE_POWER_PLUS_FIVE, max(100, nCasterLevel * 10)),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_STONESKIN),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_GREATER_STONESKIN:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis      = VFX_IMP_POLYMORPH;
            eLink     = EffectLinkEffects(EffectDamageReduction(20, DAMAGE_POWER_PLUS_FIVE, max(150, nCasterLevel * 10)),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_GREATER_STONESKIN),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_PREMONITION:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink     = EffectLinkEffects(EffectDamageReduction(50, DAMAGE_POWER_PLUS_TWENTY, nCasterLevel * 50),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_PREMONITION),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_EPIC_WARDING:
        {
            // Note the VFX for this is Epic Mage Armor but as a duration, don't like how the VFX hits the head so much, might move lower/higher.
            // Colours are pretty good for this to be like Premonition etc.
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            eLink     = EffectLinkEffects(EffectDamageReduction(30, DAMAGE_POWER_PLUS_FIVE, nCasterLevel * 10),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_EPIC_ARMOR),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_PROTECTION_FROM_ARROWS:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);

            // Scale of VFX based off target size.
            // This is experimental. Might revert to 3 set vfx files.
            // float fScale = 0.5 * fmax(StringToFloat(Get2DAString("appearance", "PREFATCKDIST", GetAppearanceType(oTarget))), 0.8);
            // SpeakString("scale: " + FloatToString(fScale));
            float fScale = GetVFXScale(oTarget);

            // DR has a scaling value
            eLink = EffectLinkEffects(EffectDamageReduction(10, GetDamagePowerPlusValue(min(nCasterLevel / 5 + 1, 5)), min(nCasterLevel * 10, 100), TRUE),
                                      EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_FROM_ARROWS, FALSE, fScale),
                                                        EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_BLUR:
            nVis      = VFX_IMP_AC_BONUS;  // TODO new VFX
            eLink     = EffectLinkEffects(EffectConcealment(20),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_BLUR),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_ENTROPIC_SHIELD:
            nVis      = VFX_IMP_AC_BONUS;  // TODO new VFX
            eLink     = EffectLinkEffects(EffectConcealment(20, MISS_CHANCE_TYPE_VS_RANGED),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOW_LIGHT_PURPLE),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_DISPLACEMENT:
            nVis      = VFX_IMP_AC_BONUS;  // TODO new VFX
            eLink     = EffectLinkEffects(EffectConcealment(50, MISS_CHANCE_TYPE_VS_RANGED),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_DISPLACEMENT),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            break;
        case SPELL_SPELL_RESISTANCE:
            nVis      = VFX_IMP_MAGIC_PROTECTION;
            eLink     = GetEffectLink(EFFECT_TYPE_SPELL_RESISTANCE_INCREASE, 12 + nCasterLevel);
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_MASS_SPELL_RESISTANCE:
            nCreatureLimit = nCasterLevel;
            nImpact        = VFX_FNF_LOS_NORMAL_20;
            nVis           = VFX_IMP_MAGIC_PROTECTION;
            eLink          = GetEffectLink(EFFECT_TYPE_SPELL_RESISTANCE_INCREASE, 12 + nCasterLevel);
            fDuration      = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_ENDURE_ELEMENTS:
            eLink     = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_ACID | DAMAGE_TYPE_COLD | DAMAGE_TYPE_ELECTRICAL | DAMAGE_TYPE_FIRE | DAMAGE_TYPE_SONIC, 10, 20),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            nVis      = VFX_IMP_ELEMENTAL_PROTECTION;
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_RESIST_ELEMENTS:
            eLink     = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_ACID | DAMAGE_TYPE_COLD | DAMAGE_TYPE_ELECTRICAL | DAMAGE_TYPE_FIRE | DAMAGE_TYPE_SONIC, 20, 30),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            nVis      = VFX_IMP_ELEMENTAL_PROTECTION;
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_PROTECTION_FROM_ELEMENTS:
            eLink     = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_ACID | DAMAGE_TYPE_COLD | DAMAGE_TYPE_ELECTRICAL | DAMAGE_TYPE_FIRE | DAMAGE_TYPE_SONIC, 30, 40),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            nVis      = VFX_IMP_ELEMENTAL_PROTECTION;
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_ENERGY_BUFFER:
            eLink     = EffectLinkEffects(EffectDamageResistance(DAMAGE_TYPE_ACID | DAMAGE_TYPE_COLD | DAMAGE_TYPE_ELECTRICAL | DAMAGE_TYPE_FIRE | DAMAGE_TYPE_SONIC, 40, 60),
                                          EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROTECTION_ELEMENTS),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            nVis      = VFX_IMP_ELEMENTAL_PROTECTION;
            fDuration = GetDuration(nCasterLevel, MINUTES);
            break;
        case SPELL_LESSER_SPELL_MANTLE:
            eLink         = GetEffectLink(EFFECT_TYPE_SPELLLEVELABSORPTION, 9, GetDiceRoll(1, 4, 6));
            fDuration     = GetDuration(nCasterLevel, ROUNDS);
            nRemoveSpell1 = SPELL_SPELL_MANTLE;
            nRemoveSpell2 = SPELL_GREATER_SPELL_MANTLE;
            break;
        case SPELL_SPELL_MANTLE:
            eLink         = GetEffectLink(EFFECT_TYPE_SPELLLEVELABSORPTION, 9, GetDiceRoll(1, 8, 8));
            fDuration     = GetDuration(nCasterLevel, ROUNDS);
            nRemoveSpell1 = SPELL_LESSER_SPELL_MANTLE;
            nRemoveSpell2 = SPELL_GREATER_SPELL_MANTLE;
            break;
        case SPELL_GREATER_SPELL_MANTLE:
            eLink         = EffectLinkEffects(EffectSpellLevelAbsorption(9, GetDiceRoll(1, 12, 10)),
                                              EffectLinkEffects(EffectVisualEffect(VFX_DUR_SPELLTURNING),
                                                                EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration     = GetDuration(nCasterLevel, ROUNDS);
            nRemoveSpell1 = SPELL_LESSER_SPELL_MANTLE;
            nRemoveSpell2 = SPELL_SPELL_MANTLE;
            break;
        case SPELL_DARKVISION_PROPER:  // New "Darkvision" spell
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink     = EffectLinkEffects(EffectBonusFeat(FEAT_DARKVISION),
                                          EffectLinkEffects(EffectSkillIncrease(SKILL_SPOT, 5),
                                                            EffectLinkEffects(EffectVisualEffect(VFX_DUR_MAGICAL_SIGHT),
                                                                              EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
        }
        break;
        case SPELL_DARKVISION:  // Ultravision
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            eLink     = GetEffectLink(EFFECT_TYPE_ULTRAVISION);
        }
        break;
        case SPELL_SEE_INVISIBILITY:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink     = GetEffectLink(EFFECT_TYPE_SEEINVISIBLE);
        }
        break;
        case SPELL_TRUE_SEEING:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink     = GetEffectLink(EFFECT_TYPE_TRUESEEING);
        }
        break;
        case SPELL_MINOR_GLOBE_OF_INVULNERABILITY:
        {
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            eLink     = GetEffectLink(EFFECT_TYPE_SPELLLEVELABSORPTION, 3, 0);
        }
        break;
        case SPELL_GLOBE_OF_INVULNERABILITY:
        {
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            eLink     = GetEffectLink(EFFECT_TYPE_SPELLLEVELABSORPTION, 4, 0);
        }
        break;
        case SPELL_INVISIBILITY:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink     = GetEffectLink(EFFECT_TYPE_INVISIBILITY);
        }
        break;
        case SPELL_IMPROVED_INVISIBILITY:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            eLink     = EffectLinkEffects(EffectRunScriptEnhanced(FALSE, "op_rs_removespel"),
                                          EffectLinkEffects(EffectConcealment(50),
                                                            EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            bSecondLink = TRUE;
            eSecondLink = ExtraordinaryEffect(EffectInvisibility(INVISIBILITY_TYPE_NORMAL));
        }
        break;
        case SPELL_IRON_BODY:
        {
/*
    The character gains damage reduction 50/+3. The character is immune to
    blindness, critical hits, ability score damage, deafness, disease, poison,
    stunning. The character gains +100% electrical damage immunity.
    The character gains +50% acid and fire damage immunity.

    The character gains a +6 enhancement bonus to the character's Strength
    score, but the character suffer a 6 Dexterity penalty as well, and the
    character's speed is reduced to half normal (walking speed). The character
    has an arcane spell failure chance of 50% and a penalty of 8 to all armor
    check skills (hide, move silently, parry, pick pocket, set trap, and
    tumble). The character cannot drink so any potions they attempt to drink
    are lost.
*/
            fDuration = GetDuration(nCasterLevel, MINUTES);
            nVis      = VFX_IMP_SUPER_HEROISM;
            eLink     = IgnoreEffectImmunity(EffectLinkEffects(EffectDamageReduction(50, DAMAGE_POWER_PLUS_THREE),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_BLINDNESS),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_CRITICAL_HIT),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_ABILITY_DECREASE),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DEAFNESS),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_DISEASE),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_POISON),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_STUN),
                        EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_ELECTRICAL, 100),
                        EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_ACID, 50),
                        EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 50),
                        EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, 6),
                        EffectLinkEffects(EffectAbilityDecrease(ABILITY_DEXTERITY, 6),
                        EffectLinkEffects(EffectForceWalk(),
                        EffectLinkEffects(EffectSpellFailure(50, 0, SPELL_FAILURE_TYPE_ARCANE),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_HIDE, 8),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_MOVE_SILENTLY, 8),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_PARRY, 8),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_PICK_POCKET, 8),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_SET_TRAP, 8),
                        EffectLinkEffects(EffectSkillDecrease(SKILL_TUMBLE, 8),
                        EffectLinkEffects(EffectVisualEffect(VFX_DUR_IRON_SKIN),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))))))))))))))))))))));
            // Mark it not curable
            eLink = EffectTagWithMetadata(eLink, TRUE);
        }
        break;
        case SPELL_AURAOFGLORY:
        {
            nImpact          = VFX_FNF_LOS_HOLY_30;
            fDuration        = GetDuration(nCasterLevel, MINUTES);
            nVis             = VFX_IMP_HEAD_HOLY;
            nHealDice        = 3;
            nHealDiceSize    = 8;
            nHealBase        = 0;

            // Apply single target effect separately - because else we'll end up
            // with two different effects for dispel magic purposes
            bApplyToTarget   = FALSE;
            eLink = EffectLinkEffects(EffectAbilityIncrease(ABILITY_CHARISMA, 4),
                    EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 5, SAVING_THROW_TYPE_FEAR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));

            ApplyVisualEffectToObject(nVis, oTarget);
            ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);

            effect eHeal = EffectHeal(GetDiceRoll(nHealDice, nHealDiceSize, nHealBase));
            ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);

            // Final link for allies
            eLink = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_ALL, 5, SAVING_THROW_TYPE_FEAR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));

        }
        break;
        case SPELL_ETHEREALNESS: // Ethereal Jaunt
        {
            fDuration = GetDuration(nCasterLevel/4, ROUNDS);
            eLink     = EffectLinkEffects(EffectEthereal(),
                        EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOW_PURPLE),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELL_ONE_WITH_THE_LAND:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis      = VFX_IMP_IMPROVE_ABILITY_SCORE;
            eLink     = EffectLinkEffects(EffectSkillIncrease(SKILL_ANIMAL_EMPATHY, 4),
                        EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, 4),
                        EffectLinkEffects(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 4),
                        EffectLinkEffects(EffectSkillIncrease(SKILL_SET_TRAP, 4),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)))));
        }
        break;
        case SPELL_STONE_BONES:
        {
            if (GetIsIncorporeal(oTarget) ||
               !GetIsRacialType(oTarget, RACIAL_TYPE_UNDEAD))
            {
                FloatingTextStrRefOnCreature(STRREF_FAILURE_THIS_SPELL_ONLY_AFFECTS_UNDEAD_CREATURES, oCaster); // * Failure! - This spell only affects undead creatures *
                return;
            }

            fDuration = GetDuration(nCasterLevel * 10, MINUTES);
            nVis      = VFX_IMP_AC_BONUS;
            eLink     = GetEffectLink(EFFECT_TYPE_AC_INCREASE, 3, AC_NATURAL_BONUS);
        }
        break;
        case SPELL_SANCTUARY:
        {
            fDuration = GetDuration(nCasterLevel, HOURS);
            nVis      = VFX_IMP_IMPROVE_ABILITY_SCORE;
            eLink     = GetEffectLink(EFFECT_TYPE_SANCTUARY, nSpellSaveDC);
        }
        break;
        case SPELL_NEGATIVE_ENERGY_PROTECTION:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            nVis      = VFX_IMP_HOLY_AID;
            eLink     = EffectLinkEffects(EffectDamageImmunityIncrease(DAMAGE_TYPE_NEGATIVE, 100),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_ABILITY_DECREASE),
                        EffectLinkEffects(EffectImmunity(IMMUNITY_TYPE_NEGATIVE_LEVEL),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
        }
        break;
        case SPELL_SHIELD:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            nVis      = VFX_IMP_AC_BONUS;
            eLink     = EffectLinkEffects(EffectACIncrease(4, AC_DEFLECTION_BONUS),
                        EffectLinkEffects(EffectSpellImmunity(SPELL_MAGIC_MISSILE),
                        EffectLinkEffects(EffectVisualEffect(VFX_DUR_GLOBE_MINOR),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))));
        }
        break;
        case SPELL_IRONGUTS:
        {
            fDuration = GetDuration(nCasterLevel * 10, MINUTES);
            nVis      = VFX_IMP_HEAD_ACID;
            // Mimic original Bioware spell, fire a second visual!
            DelayCommand(0.3, ApplyVisualEffectToObject(VFX_IMP_HEAD_HOLY, oTarget));
            eLink     = EffectLinkEffects(EffectSavingThrowIncrease(SAVING_THROW_FORT, 5, SAVING_THROW_TYPE_POISON),
                                          EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        case SPELL_SHIELD_OF_FAITH:
        {
            fDuration = GetDuration(nCasterLevel, MINUTES);
            nVis = VFX_IMP_AC_BONUS;
            int nValue = min(5, 2 + (nCasterLevel)/6);
            eLink     = GetEffectLink(EFFECT_TYPE_AC_INCREASE, nValue, AC_DEFLECTION_BONUS, VFX_DUR_PROTECTION_GOOD_MINOR);
        }
        break;
        // Spell Abilities
        case SPELLABILITY_DIVINE_PROTECTION:
        {
            nSpellSaveDC = 10 + GetAbilityModifier(ABILITY_CHARISMA, oCaster) + GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
            nCasterLevel = GetAbilityModifier(ABILITY_CHARISMA, oCaster) + GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
            fDuration    = GetDuration(nCasterLevel, ROUNDS);
            nVis         = VFX_IMP_HOLY_AID;
            eLink        = EffectLinkEffects(EffectSanctuary(nSpellSaveDC),
                           EffectLinkEffects(EffectVisualEffect(VFX_DUR_SANCTUARY),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
        }
        break;
        case SPELLABILITY_DIVINE_STRENGTH:
        {
            nCasterLevel = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
            fDuration    = GetDuration(5 + GetAbilityModifier(ABILITY_CHARISMA, oCaster), ROUNDS);
            nVis         = VFX_IMP_HOLY_AID;
            int nBonus   = (nCasterLevel/3) + 2;
            eLink        = EffectLinkEffects(EffectAbilityIncrease(ABILITY_STRENGTH, nBonus),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE));
        }
        break;
        case SPELLABILITY_DIVINE_TRICKERY:
        {
            nCasterLevel = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
            fDuration    = GetDuration(5 + GetAbilityModifier(ABILITY_CHARISMA, oCaster), ROUNDS);
            nVis         = VFX_IMP_MAGICAL_VISION;
            int nBonus   = max(1, nCasterLevel/2);
            eLink        = EffectLinkEffects(EffectSkillIncrease(SKILL_SEARCH, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_DISABLE_TRAP, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_MOVE_SILENTLY, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_OPEN_LOCK, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_PICK_POCKET, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_HIDE, nBonus),
                           EffectLinkEffects(EffectSkillIncrease(SKILL_PERSUADE, nBonus),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))))));
        }
        break;
        case SPELLABILITY_BATTLE_MASTERY:
        {
            nCasterLevel = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster);
            fDuration    = GetDuration(5 + GetAbilityModifier(ABILITY_CHARISMA, oCaster), ROUNDS);
            nVis         = VFX_IMP_HOLY_AID;
            int nBonus   = 1 + (nCasterLevel/5);
            // The original script adds +10 for "Epic bonus". Hmm. Not going to
            // include seems silly when the others don't and it's not documented.
            int nDamageBonus = nBonus;
            int nDamageReductionBonus = nBonus * 2;

            eLink        = EffectLinkEffects(EffectAttackIncrease(nBonus),
                           EffectLinkEffects(EffectAbilityIncrease(ABILITY_CONSTITUTION, nBonus),
                           EffectLinkEffects(EffectAbilityIncrease(ABILITY_DEXTERITY, nBonus),
                           EffectLinkEffects(EffectDamageIncrease(nDamageBonus, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING),
                           EffectLinkEffects(EffectDamageReduction(nDamageReductionBonus, DAMAGE_POWER_PLUS_FIVE),
                                             EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE))))));
        }
        break;
        case SPELLABILITY_MUMMY_BOLSTER_UNDEAD:
        {
            fDuration = GetDuration(10, ROUNDS);
            eLink = GetEffectLink(EFFECT_TYPE_TURN_RESISTANCE_INCREASE, GetHitDice(oCaster)/4);
            nVis = VFX_IMP_HEAD_EVIL;
            nImpact = VFX_FNF_LOS_EVIL_30;
            bDelayRandom = TRUE;
        }
        break;
        case SPELLABILITY_HASTE_SLOW:
        {
            fDuration = GetDuration(nCasterLevel, ROUNDS);
            if (d100() > 33)
            {
                // NB: Just to make it clearer for the AI we consider this HASTE
                nSpellId = SPELL_HASTE;
                eLink = GetEffectLink(EFFECT_TYPE_HASTE);
                nVis = VFX_IMP_HASTE;
            }
            else
            {
                // NB: Just to make it clearer for the AI we consider this SLOW
                nSpellId = SPELL_SLOW;
                eLink = GetEffectLink(EFFECT_TYPE_SLOW);
                nVis = VFX_IMP_SLOW;
            }
            // This is always considered a hostile spell.
        }
        break;
        case SPELLABILITY_ETHEREALNESS:
        {
            eLink = EffectLinkEffects(EffectEthereal(),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_BLUR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(5, ROUNDS);
        }
        break;
        case SPELLABILITY_SHADOWBLEND:
        {
            // Can be dispelled
            eLink = EffectLinkEffects(EffectConcealment(90),
                    EffectLinkEffects(EffectVisualEffect(VFX_DUR_PROT_SHADOW_ARMOR),
                                      EffectVisualEffect(VFX_DUR_CESSATE_POSITIVE)));
            fDuration = GetDuration(10, ROUNDS);

            // Doesn't work with continual flame applied. Sure Bioware.
            if (GetHasSpellEffect(SPELL_CONTINUAL_FLAME, oTarget)) return;
        }
        break;
        default:
        {
            if (DEBUG_LEVEL >= ERROR) Error("No valid spell ID passed in: " + IntToString(nSpellId));
            return;
        }
        break;
    }

    ApplyVisualEffectAtLocation(nImpact, lTarget);

    int nTargetType = SPELL_TARGET_ALLALLIES;

    // If this is not an AOE spell we don't care what target type it is
    if (!GetSpellIsAreaOfEffect(nSpellId)) nTargetType = SPELL_TARGET_ANYTHING;

    object oToIgnore = OBJECT_INVALID;
    if (!bApplyToTarget) oToIgnore = oTarget;

    json jArray = GetArrayOfTargets(nTargetType, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE, oToIgnore);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray) && nCreatureLimit > 0; nIndex++)
    {
        nCreatureLimit--;

        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = bDelayRandom ? GetRandomDelay() : GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        // Remove previous castings
        RemoveEffectsFromSpell(oTarget, nSpellId);
        if (nRemoveSpell1 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell1);
        if (nRemoveSpell2 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell2);
        if (nRemoveSpell3 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell3);
        if (nRemoveSpell4 != SPELL_INVALID) RemoveEffectsFromSpell(oTarget, nRemoveSpell4);

        if (nVis != VFX_INVALID) DelayCommand(fDelay, ApplyVisualEffectToObject(nVis, oTarget));
        DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
        if (bSecondLink) DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eSecondLink, oTarget, fDuration));

        // Optional healing
        if (nHealDice > 0 || nHealBase > 0)
        {
            effect eHeal = EffectHeal(GetDiceRoll(nHealDice, nHealDiceSize, nHealBase));
            DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget));
        }
    }
}
