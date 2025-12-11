//:://////////////////////////////////////////////
//:: Beholder Special Attacks
//:: op_a_beholder
//:://////////////////////////////////////////////
/*
    SPELLABILITY_BEHOLDER_SPECIAL_ATTACKS - Base ability (Bioware script
        x2_s1_beholdatt) that then decides targets and fires off the rays
        that fire this script again.

        Also deals with deciding to use the beholders Antimagic Eye (casting the
        SPELLABILITY_BEHOLDER_ANTIMAGIC_CONE if needed).

        This "spell" can be ignored if the AI deals with the stuff instead.

    Ray attacks. There are 10 in the 3E monster manual. Each eyes effects
    resemble a spell cast by a level 13 sorcerer. Save DC is 18.
    * Charm Person
    * Charm Monster
    * Sleep
    * Flesh to Stone
    * Disintegrate
    * Fear
    * Slow
    * Inflict Moderate Wounds
    * Finger of Death
    * Telekinesis

    Bioware changed (and limited) these to the below, and changed the save DC
    to 15.

    SPELLABILITY_BEHOLDER_RAY_DEATH       - Finger of Death (Death or d6(3) + 13 magical damage)
    SPELLABILITY_BEHOLDER_RAY_TELEKENESIS - Knockdown (1 round)
    SPELLABILITY_BEHOLDER_RAY_PETRIFY     - Flesh to Stone (Petrify, may be permanent as per rules)
    SPELLABILITY_BEHOLDER_RAY_CHARM       - Charm Person or Monster (4 rounds)
    SPELLABILITY_BEHOLDER_RAY_SLOW        - Slow (6 rounds)
    SPELLABILITY_BEHOLDER_RAY_WOUND       - Inflict Moderate Wounds (d8(2) + 10 magical damage)
    SPELLABILITY_BEHOLDER_RAY_FEAR        - Fear (1 + d4() rounds)
    SPELLABILITY_BEHOLDER_RAY_UNUSED_1    - Missing ones are sleep, disintegrate and one of the charms
    SPELLABILITY_BEHOLDER_RAY_UNUSED_2
    SPELLABILITY_BEHOLDER_RAY_UNUSED_3
*/
//:://////////////////////////////////////////////
//:: Part of the Overhaul Project; see for dates/creator info
//:: https://github.com/Finaldeath/overhaul
//:://////////////////////////////////////////////

#include "op_i_spells"

// SPELLABILITY_BEHOLDER_RAY_*
int BeholderDetermineHasEffect(int nRay, object oCreature);
int BeholderGetTargetThreatRating(object oTarget);


void main()
{
    if (DoSpellHook()) return;

    int nImmunityType = IMMUNITY_TYPE_NONE;
    int nSavingThrow = SAVING_THROW_NONE;
    int nSaveType = SAVING_THROW_TYPE_NONE;
    float fDuration = 0.0;
    effect eLink;
    int nVis = VFX_NONE;
    int nDamage = 0;

    switch (nSpellId)
    {
        case SPELLABILITY_BEHOLDER_SPECIAL_ATTACKS:
        {
            // This is technically an AI script more than anything with no
            // projectiles on the spell and no cast time.
            // We are going to mimic the default AI since frankly this is
            // for now just for compatibility.

            /*
            struct beholder_target_struct stTargets = GetRayTargets(oTarget);
            int nRay;
            int nOdd;
            if (stTargets.nCount ==0)
            {
                //emergency fallback
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget1);
            }
            else if (stTargets.nCount ==1) // AI for only one target
            {
                nOdd=d2()==1;
                if (nOdd)
                {
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget1);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget1);
                }
                else
                {
                    BehDoFireBeam(BEHOLDER_RAY_WOUND,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget1);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_PETRI,stTargets.oTarget1);
                }
                if (d3()==1)
                {
                    BehDoFireBeam(BEHOLDER_RAY_CHARM,stTargets.oTarget2);
                }
            }
            else if (stTargets.nCount ==2)
            {
                if (nOdd)
                {
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_WOUND,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget2);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_PETRI,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_CHARM,stTargets.oTarget2);
                }
                else
                {
                    BehDoFireBeam(BEHOLDER_RAY_WOUND,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget1);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_PETRI,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget2);
                }
            }
            else if (stTargets.nCount ==3)
            {
               if (nOdd)
               {
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget1);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_WOUND,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget3);
                    BehDoFireBeam(BEHOLDER_RAY_PETRI,stTargets.oTarget3);
                    BehDoFireBeam(BEHOLDER_RAY_CHARM,stTargets.oTarget2);
               }
               else
               {
                    BehDoFireBeam(BEHOLDER_RAY_DEATH,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_SLOW,stTargets.oTarget3);
                    BehDoFireBeam(BEHOLDER_RAY_FEAR,stTargets.oTarget1);
                    if (d2()==1)
                        BehDoFireBeam(BEHOLDER_RAY_WOUND,stTargets.oTarget2);
                    BehDoFireBeam(BEHOLDER_RAY_TK,stTargets.oTarget1);
                    BehDoFireBeam(BEHOLDER_RAY_PETRI,stTargets.oTarget3);
                    BehDoFireBeam(BEHOLDER_RAY_CHARM,stTargets.oTarget1);
               }
            }
            */
            // Only fire Antimagic Cone if we are beholders and not beholder mages
            switch (GetAppearanceType(oCaster))
            {
                case APPEARANCE_TYPE_BEHOLDER:
                case APPEARANCE_TYPE_BEHOLDER_EYEBALL:
                case APPEARANCE_TYPE_BEHOLDER_MOTHER:
                {
                    // We check if we want to use the cone here.
                    // Bioware used 4+ of a spellcasting class, and that they
                    // don't have negative effects we'd remove.
                    // Yeah it's an AOE thing though...
                    if (!GetHasSpellEffect(SPELLABILITY_BEHOLDER_ANTIMAGIC_CONE, oTarget))
                    {
                        // Can't be affected by these statuses
                        int bAffected = FALSE;
                        effect eTest = GetFirstEffect(oTarget);
                        while (GetIsEffectValid(eTest) && !bAffected)
                        {
                            int nType = GetEffectType(eTest);
                            if (nType == EFFECT_TYPE_STUNNED || nType == EFFECT_TYPE_PARALYZE  ||
                                nType == EFFECT_TYPE_SLEEP || nType == EFFECT_TYPE_PETRIFY  ||
                                nType == EFFECT_TYPE_CHARMED  || nType == EFFECT_TYPE_CONFUSED ||
                                nType == EFFECT_TYPE_FRIGHTENED || nType == EFFECT_TYPE_SLOW)
                            {
                                bAffected = TRUE;
                            }
                            eTest = GetNextEffect(oTarget);
                        }
                        if (!bAffected)
                        {
                            int nSlot, nLevels = 0;
                            for (nSlot = 1; nSlot <= GetMaximumCreatureClassSlot(); nSlot++)
                            {
                                if (GetClassIsSpellcaster(GetClassByPosition(nSlot, oTarget)))
                                {
                                    nLevels += GetLevelByClass(GetClassByPosition(nSlot, oTarget), oTarget);
                                }
                            }
                            if (nLevels >= 4)
                            {
                                // Instantly activate
                                ActionCastSpellAtObject(SPELLABILITY_BEHOLDER_ANTIMAGIC_CONE, oTarget, METAMAGIC_NONE, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
                            }
                        }
                    }
                }
                break;
            }
        }
        break;
        case SPELLABILITY_BEHOLDER_RAY_CHARM:
        {
            eLink = GetEffectLink(EFFECT_TYPE_CHARMED);
            nVis = VFX_IMP_CHARM;
            nSavingThrow = SAVING_THROW_WILL;
            nSaveType = SAVING_THROW_TYPE_NONE;
            nImmunityType = IMMUNITY_TYPE_CHARM;
            fDuration = GetDuration(4, ROUNDS);
        }
        break;
        case SPELLABILITY_BEHOLDER_RAY_DEATH:
        {
            eLink = GetEffectLink(EFFECT_TYPE_DEATH);
            nVis = VFX_IMP_DEATH;
            nSavingThrow = SAVING_THROW_FORT;
            nSaveType = SAVING_THROW_TYPE_DEATH;
            nImmunityType = IMMUNITY_TYPE_DEATH;
        }
        break;
        case SPELLABILITY_BEHOLDER_RAY_FEAR:
        {
            eLink = GetEffectLink(EFFECT_TYPE_FRIGHTENED);
            nVis = VFX_IMP_FEAR_S;
            nSavingThrow = SAVING_THROW_WILL;
            nSaveType = SAVING_THROW_TYPE_FEAR;
            nImmunityType = IMMUNITY_TYPE_FEAR;
            fDuration = GetDuration(1+d4(), ROUNDS);
        }
        break;
        /*
        case SPELLABILITY_BEHOLDER_RAY_PETRIFY:
        {
            // In op_s_petrify
        }
        break;
        */
        case SPELLABILITY_BEHOLDER_RAY_SLOW:
        {
            eLink = GetEffectLink(EFFECT_TYPE_SLOW);
            nVis = VFX_IMP_SLOW;
            nSavingThrow = SAVING_THROW_WILL;
            nImmunityType = IMMUNITY_TYPE_SLOW;
            fDuration = GetDuration(6, ROUNDS);
        }
        break;
        case SPELLABILITY_BEHOLDER_RAY_TELEKENESIS:
        {
            eLink = GetEffectLink(EFFECT_TYPE_KNOCKDOWN);
            nVis = VFX_IMP_STUN;
            nSavingThrow = SAVING_THROW_WILL;
            nImmunityType = IMMUNITY_TYPE_KNOCKDOWN;
            fDuration = GetDuration(1, ROUNDS);
        }
        break;
        case SPELLABILITY_BEHOLDER_RAY_WOUND:
        {
            nDamage = d8(2) + 10;
            nVis = VFX_COM_BLOOD_REG_RED;
            nSavingThrow = SAVING_THROW_FORT;
        }
        break;
    }

    eLink = ExtraordinaryEffect(eLink);

    SignalSpellCastAt();

    // Immunity
    if (!GetIsImmuneWithFeedback(oTarget, oCaster, nImmunityType))
    {
        // Saving throw
        if (!DoSavingThrow(oTarget, oCaster, nSavingThrow, nSpellSaveDC, nSaveType))
        {
            if (nDamage > 0)
            {
                ApplyDamageToObject(oTarget, nDamage);
            }
            else if (fDuration > 0.0)
            {
                ApplySpellEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, fDuration);
            }
            else
            {
                ApplySpellEffectToObject(DURATION_TYPE_INSTANT, eLink, oTarget);
            }
        }
        else if (nSpellId == SPELLABILITY_BEHOLDER_RAY_DEATH)
        {
            ApplyDamageWithVFXToObject(oTarget, VFX_IMP_NEGATIVE_ENERGY, d6(3) + 13);
        }
    }
}

// SPELLABILITY_BEHOLDER_RAY_*
int BeholderDetermineHasEffect(int nRay, object oCreature)
{
    switch (nRay)
    {
        case SPELLABILITY_BEHOLDER_RAY_FEAR:
            if (GetHasEffect(oCreature, EFFECT_TYPE_FRIGHTENED)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_DEATH:
            if (GetIsDead(oCreature)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_CHARM:
            if (GetHasEffect(oCreature, EFFECT_TYPE_CHARMED)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_SLOW:
            if (GetHasEffect(oCreature, EFFECT_TYPE_SLOW)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_PETRIFY:
            if (GetHasEffect(oCreature, EFFECT_TYPE_PETRIFY)) return TRUE;
    }
    return FALSE;
}

int BeholderGetTargetThreatRating(object oTarget)
{
    if (oTarget == OBJECT_INVALID || GetIsDead(oTarget))
    {
        return 0;
    }

    int nRet = 20;
    if (GetDistanceBetween(oTarget, oCaster) <5.0f)
    {
        nRet += 3;
    }

    nRet += (GetHitDice(oTarget) - GetHitDice(oCaster) /2);

    if (GetPlotFlag(oTarget))
    {
        nRet -= 6 ;
    }

    if (GetMaster(oTarget)!= OBJECT_INVALID)
    {
        nRet -= 4;
    }

    if (GetHasEffect(oTarget, EFFECT_TYPE_PETRIFY))
    {
        nRet -=10;
    }

    return nRet;
}


