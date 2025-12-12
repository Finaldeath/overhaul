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

        Either better AI or a if in the future projectiles can be done without
        actions we can consolidate this and make it much easier.


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
    SPELLABILITY_BEHOLDER_RAY_CHARM       - Charm Person or Monster (4 rounds) (Actually "Charm anything"). Against PCs/PC associates it turns into Daze anyway.
    SPELLABILITY_BEHOLDER_RAY_SLOW        - Slow (6 rounds)
    SPELLABILITY_BEHOLDER_RAY_WOUND       - Inflict Moderate Wounds (d8(2) + 10 magical damage)
    SPELLABILITY_BEHOLDER_RAY_FEAR        - Fear (1 + d4() rounds)
    SPELLABILITY_BEHOLDER_RAY_UNUSED_1    - Missing ones are sleep, disintegrate and one of the charm variants
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
void BeholderDoFireRay(object oTarget, int nRay);

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
            // From reading Bioware's code it does some "target prioritisation"
            // around a PC and their summon/henchman, but bizarrely doesn't
            // use it to even validate targets to check if they're even
            // alive.
            // We'll simplify but keep Bioware's logic of 3 targets max. We
            // also will correct the fact there are a ton of logic errors.
            // We assume oTarget is always valid.
            // If oTarget has a master, use them, their summon/henchman (if not oTarget)
            // as the third target.

            object oTarget1 = oTarget;
            object oTarget2, oTarget3;
            int nTargets = 1;

            object oMaster = GetMaster(oTarget);
            if (GetIsObjectValid(oMaster))
            {
                // Check for validity...and swap kind of like how Bioware did
                if (GetObjectSeen(oMaster) && !GetIsDead(oMaster))
                {
                    // Prioritise the master
                    oTarget1 = oMaster;
                    // Second target is now the associate
                    oTarget2 = oTarget;
                    nTargets = 2;

                    // Check other associates to add a third
                    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oMaster, 1);
                    object oHenchman = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oMaster, 1);
                    if (GetIsObjectValid(oSummon) && !GetIsDead(oSummon) && oSummon != oTarget)
                    {
                        oTarget3 = oSummon;
                        nTargets = 3;
                    }
                    else if (GetIsObjectValid(oHenchman) && !GetIsDead(oHenchman) && oHenchman != oTarget)
                    {
                        oTarget3 = oHenchman;
                        nTargets = 3;
                    }
                }
            }

            // This is Bioware's code but fixed up and made more senaible.
            // However it is still quite weird.
            if (nTargets == 1)
            {
                if (d2() == 1)
                {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_SLOW);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_DEATH);
                    if (d2() == 1)
                        BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_FEAR);
                }
                else
                {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_WOUND);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);
                    if (d2() == 1)
                        BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_PETRIFY);
                }
                if (d3() == 1)
                {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_CHARM);
                }
            }
            else if (nTargets == 2)
            {
                if (d2() == 1)
                {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_SLOW);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_DEATH);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_FEAR);

                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_WOUND);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);
                    if (d2() == 1)
                        BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_PETRIFY);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_CHARM);
                }
                else
                {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_WOUND);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);
                    if (d2() == 1)
                        BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);

                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_SLOW);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_DEATH);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_FEAR);
                }
            }
            else if (nTargets == 3)
            {
               if (d2() == 1)
               {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_DEATH);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_SLOW);

                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_WOUND);
                    if (d2() == 1)
                        BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_FEAR);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_CHARM);

                    BeholderDoFireRay(oTarget3, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);
                    BeholderDoFireRay(oTarget3, SPELLABILITY_BEHOLDER_RAY_PETRIFY);
               }
               else
               {
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_FEAR);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_TELEKENESIS);
                    BeholderDoFireRay(oTarget1, SPELLABILITY_BEHOLDER_RAY_CHARM);

                    if (d2() == 1)
                        BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_WOUND);
                    BeholderDoFireRay(oTarget2, SPELLABILITY_BEHOLDER_RAY_DEATH);

                    BeholderDoFireRay(oTarget3, SPELLABILITY_BEHOLDER_RAY_SLOW);
                    BeholderDoFireRay(oTarget3, SPELLABILITY_BEHOLDER_RAY_PETRIFY);
               }
            }
            else
            {
                if (DEBUG_LEVEL >= ERROR) Error("Beholder beams no valid targets?");
            }

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

        case SPELLABILITY_BEHOLDER_RAY_CHARM:
            if (GetHasEffect(oCreature, EFFECT_TYPE_CHARMED)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_SLOW:
            if (GetHasEffect(oCreature, EFFECT_TYPE_SLOW)) return TRUE;

        case SPELLABILITY_BEHOLDER_RAY_PETRIFY:
            if (GetHasEffect(oCreature, EFFECT_TYPE_PETRIFY)) return TRUE;
    }
    return FALSE;
}

void BeholderDoFireRay(object oTarget, int nRay)
{
    // Don't use a ray if it's already got an effect
    if (BeholderDetermineHasEffect(nRay, oTarget)) return;

    int bHit = DoTouchAttack(oTarget, oCaster, TOUCH_RANGED, FALSE);

    if (bHit)
    {
         ActionCastSpellAtObject(nRay,oTarget,METAMAGIC_ANY,TRUE,0,PROJECTILE_PATH_TYPE_DEFAULT,TRUE);
    }
    else
    {
        // Bioware's miss code
        location lFail = GetLocation(oTarget);
        vector vFail = GetPositionFromLocation(lFail);

        if (GetDistanceBetween(oCaster, oTarget) > 6.0f)
        {
           vFail.x += IntToFloat(Random(3)) - 1.5;
           vFail.y += IntToFloat(Random(3)) - 1.5;
           vFail.z += IntToFloat(Random(2));
           lFail = Location(GetArea(oTarget),vFail,0.0f);
        }
        //----------------------------------------------------------------------
        // if we are fairly near, calculating a location could cause us to
        // spin, so we use the same location all the time
        //----------------------------------------------------------------------
        else
        {
              vFail.z += 0.8;
              vFail.y += 0.2;
              vFail.x -= 0.2;
        }
        ActionCastFakeSpellAtLocation(nRay, lFail);
    }
}

