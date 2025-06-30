//::///////////////////////////////////////////////
//:: Curse Song
//:: op_f_cursesong.nss
//:://////////////////////////////////////////////
/*
    Bards are able to sing a song that can curse their enemies. Deafened creatures
    are not affected by the bard's singing. The song affects all enemies within
    30 feet and lasts for 10 rounds. The higher the bard's final Perform skill
    and class level, the more powerful the Curse song. All of the penalties
    listed are additive.
    3 Perform and Bard Level 1: -1 to Attack and Damage rolls.
    6 Perform and Bard Level 2: -1 to Will Saves.
    9 Perform and Bard Level 3: -1 to Damage rolls and -1 to Fortitude Saves.
    12 Perform and Bard Level 6: -1 to Reflex saves, -1 to Skill rolls.
    15 Perform and Bard Level 8: -1 to Attack rolls, 8 damage.
    18 Perform and Bard Level 11: -2 to Dodge Armor Class, -1 to Skill rolls.
    Perform 21 and Bard Level 14: -1 to Damage rolls, 8 damage and -1 Dodge Armor Class.
    Perform 24 and Bard Level 15: -1 Will Saves, -1 Reflex Saves, -1 Fortitude Saves, -1 Dodge Armor Class.
    Perform 25 and Bard Level 16: -1 Will Saves, 4 damage. -1 Dodge Armor Class.
    For each additional 5 Perform and 1 Class level in Bard an additional 2 damage is granted.
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

void main()
{
    if (DoSpellHook()) return;

    if (!GetHasFeat(FEAT_BARD_SONGS, oCaster))
    {
        FloatingTextStrRefOnCreature(85587, oCaster, FALSE); // This ability is tied to your bard song ability, which has no more uses for today.
        return;
    }
    // Reduce Bard Song usage
    DecrementRemainingFeatUses(oCaster, FEAT_BARD_SONGS);

    // Can we speak (ie sing)
    if (!GetCanSpeak(oCaster))
    {
        FloatingTextStrRefOnCreature(85764, oCaster, FALSE); // * You can not use this feat while silenced *
        return;
    }

    // Work out the effects we want to do. Basically we're copying the Bioware
    // code cleaned up a little, since we're not looking to split it into its
    // separate parts or alter the progression.
    nSpellId = SPELLABILITY_EPIC_CURSE_SONG; // Just in case we have other feats/spells trigger this we reset it now (note this isn't "Epic"! Bioware constant mistake)
    int nLevel = GetLevelByClass(CLASS_TYPE_BARD, oCaster);
    int nPerform = GetSkillRank(SKILL_PERFORM, oCaster);

    int nAttack;
    int nDamage;
    int nWill;
    int nFort;
    int nReflex;
    int nHP;
    int nAC;
    int nSkill;

    // Work out the duration, same as Bioware did it
    float fDuration = GetDuration(10, ROUNDS);

    // Check to see if the caster has Lasting Impression and increase duration.
    if(GetHasFeat(FEAT_EPIC_LASTING_INSPIRATION))
    {
        fDuration *= 10.0;
    }

    // Lingering Song +5 rounds duration
    if(GetHasFeat(FEAT_LINGERING_SONG))
    {
        fDuration += 5;
    }

    if(nPerform >= 100 && nLevel >= 30)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 48;
        nAC = 7;
        nSkill = 18;
    }
    else if(nPerform >= 95 && nLevel >= 29)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 46;
        nAC = 6;
        nSkill = 17;
    }
    else if(nPerform >= 90 && nLevel >= 28)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 44;
        nAC = 6;
        nSkill = 16;
    }
    else if(nPerform >= 85 && nLevel >= 27)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 42;
        nAC = 6;
        nSkill = 15;
    }
    else if(nPerform >= 80 && nLevel >= 26)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 40;
        nAC = 6;
        nSkill = 14;
    }
    else if(nPerform >= 75 && nLevel >= 25)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 38;
        nAC = 6;
        nSkill = 13;
    }
    else if(nPerform >= 70 && nLevel >= 24)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 36;
        nAC = 5;
        nSkill = 12;
    }
    else if(nPerform >= 65 && nLevel >= 23)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 34;
        nAC = 5;
        nSkill = 11;
    }
    else if(nPerform >= 60 && nLevel >= 22)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 32;
        nAC = 5;
        nSkill = 10;
    }
    else if(nPerform >= 55 && nLevel >= 21)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 30;
        nAC = 5;
        nSkill = 9;
    }
    else if(nPerform >= 50 && nLevel >= 20)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 28;
        nAC = 5;
        nSkill = 8;
    }
    else if(nPerform >= 45 && nLevel >= 19)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 26;
        nAC = 5;
        nSkill = 7;
    }
    else if(nPerform >= 40 && nLevel >= 18)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 24;
        nAC = 5;
        nSkill = 6;
    }
    else if(nPerform >= 35 && nLevel >= 17)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 22;
        nAC = 5;
        nSkill = 5;
    }
    else if(nPerform >= 30 && nLevel >= 16)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 3;
        nFort = 2;
        nReflex = 2;
        nHP = 20;
        nAC = 5;
        nSkill = 4;
    }
    else if(nPerform >= 24 && nLevel >= 15)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 2;
        nFort = 2;
        nReflex = 2;
        nHP = 16;
        nAC = 4;
        nSkill = 3;
    }
    else if(nPerform >= 21 && nLevel >= 14)
    {
        nAttack = 2;
        nDamage = 3;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 16;
        nAC = 3;
        nSkill = 2;
    }
    else if(nPerform >= 18 && nLevel >= 11)
    {
        nAttack = 2;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 8;
        nAC = 2;
        nSkill = 2;
    }
    else if(nPerform >= 15 && nLevel >= 8)
    {
        nAttack = 2;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 8;
        nAC = 0;
        nSkill = 1;
    }
    else if(nPerform >= 12 && nLevel >= 6)
    {
        nAttack = 1;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 1;
        nHP = 0;
        nAC = 0;
        nSkill = 1;
    }
    else if(nPerform >= 9 && nLevel >= 3)
    {
        nAttack = 1;
        nDamage = 2;
        nWill = 1;
        nFort = 1;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }
    else if(nPerform >= 6 && nLevel >= 2)
    {
        nAttack = 1;
        nDamage = 1;
        nWill = 1;
        nFort = 0;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }
    else if(nPerform >= 3 && nLevel >= 1)
    {
        nAttack = 1;
        nDamage = 1;
        nWill = 0;
        nFort = 0;
        nReflex = 0;
        nHP = 0;
        nAC = 0;
        nSkill = 0;
    }

    // Linked Effect
    effect eLink = EffectLinkEffects(EffectAttackDecrease(nAttack),
                                     EffectDamageDecrease(nDamage, DAMAGE_TYPE_BLUDGEONING | DAMAGE_TYPE_SLASHING | DAMAGE_TYPE_PIERCING));

    if(nWill > 0)
    {
        eLink = EffectLinkEffects(eLink, EffectSavingThrowDecrease(SAVING_THROW_WILL, nWill));
    }
    if(nFort > 0)
    {
        eLink = EffectLinkEffects(eLink, EffectSavingThrowDecrease(SAVING_THROW_FORT, nFort));
    }
    if(nReflex > 0)
    {
        eLink = EffectLinkEffects(eLink, EffectSavingThrowDecrease(SAVING_THROW_REFLEX, nReflex));
    }
    if(nAC > 0)
    {
        eLink = EffectLinkEffects(eLink, EffectACDecrease(nAC, AC_DODGE_BONUS));
    }
    if(nSkill > 0)
    {
        eLink = EffectLinkEffects(eLink, EffectSkillDecrease(SKILL_ALL_SKILLS, nSkill));
    }

    // Finish the link
    eLink = EffectLinkEffects(eLink, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE));
    eLink = ExtraordinaryEffect(eLink);

    ApplyVisualEffectAtLocation(VFX_FNF_LOS_EVIL_30, lTarget);

    // We'll remove any existing Curse Song "singing" VFX from ourselves and apply a new one.
    // In the future maybe we'll stop us using Curse Song again when it's already in effect.
    RemoveEffectsFromSpell(oCaster, nSpellId, EFFECT_TYPE_ALL, "SINGING");
    effect eSinging = ExtraordinaryEffect(TagEffect(EffectVisualEffect(VFX_DUR_BARD_SONG_EVIL), "SINGING"));
    ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eSinging, oCaster, fDuration);

    // Get all enemies
    json jArray = GetArrayOfTargets(SPELL_TARGET_SELECTIVEHOSTILE, SORT_METHOD_DISTANCE, OBJECT_TYPE_CREATURE);
    int nIndex;
    for (nIndex = 0; nIndex < JsonGetLength(jArray); nIndex++)
    {
        oTarget = GetArrayObject(jArray, nIndex);

        SignalSpellCastAt();

        float fDelay = GetDistanceBetweenLocations(GetLocation(oTarget), lTarget) / 20.0;

        if(GetCanHear(oTarget))
        {
            // Bards who have sung a Curse Song can still be affected by enemy Curse Songs
            if (!GetHasEffect(oTarget, EFFECT_TYPE_ATTACK_DECREASE, nSpellId))
            {
                DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_DOOM, oTarget));
                DelayCommand(fDelay, ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration));
                if (nHP > 0)
                {
                    DelayCommand(fDelay, ApplyDamageWithVFXToObject(oTarget, VFX_IMP_SONIC, nHP, DAMAGE_TYPE_SONIC));
                }
            }
        }
        else
        {
            DelayCommand(fDelay, ApplyVisualEffectToObject(VFX_IMP_MAGIC_RESISTANCE_USE, oTarget));
        }
    }
}

