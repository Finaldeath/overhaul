//:://////////////////////////////////////////////////
//:: X0_S2_RODWONDER
/*
Spell script for Rod of Wonder spell.

This spell produces a random spell effect.


 */
//:://////////////////////////////////////////////////
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/25/2002
//:://////////////////////////////////////////////////

#include "x0_i0_petrify"
#include "x0_i0_spells"
#include "x0_i0_common"
#include "x0_i0_position"

/**********************************************************************
 * TEMPORARY CONSTANTS
 **********************************************************************/

const int SPELL_GEM_SPRAY = 504;
const int SPELL_BUTTERFLY_SPRAY = 505;

/**********************************************************************
 * FUNCTION PROTOTYPES
 * These are generally custom variations on various spells.
 **********************************************************************/

// Nothing happens message
void DoNothing(object oCaster);

// Windstorm-force gust of wind effect -- knocks down everyone in the area
void DoWindstorm(location lTarget);

// Give short-term premonition (d4 rounds & up to d4*5 hp damage absorbed)
void DoDetectThoughts(object oCaster);

// Summon a penguin, cow, or deer
void DoSillySummon(object oTarget);

// Do a blindness spell on all in the given radius of a cone for the given
// number of rounds in duration.
void DoBlindnessEffect(object oCaster, location lTarget, float fRadius, int nDuration);



/**********************************************************************
 * MAIN FUNCTION DEFINITION
 **********************************************************************/


void main()
{
    object oCaster = OBJECT_SELF;
    object oTarget = GetAttemptedSpellTarget();
    if(oTarget == OBJECT_INVALID)
        oTarget = oCaster;
    location lTargetLoc = GetSpellTargetLocation();

    // Create a placeable object to act as the caster
    object oCastingObject = CreateObject(OBJECT_TYPE_PLACEABLE,
                                         "q6_wild_magic",
                                         GetLocation(oCaster));

    int nRoll = d100();

        // All the random effects

    DBG_msg("Rod nRoll: " + IntToString(nRoll));

    // 1 - 5
    if (nRoll < 6) {
        // stone hold target for 2 rounds
        effect eHold = EffectMovementSpeedDecrease(99);
        effect eVis = EffectVisualEffect(VFX_DUR_STONEHOLD);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                            eHold, oTarget, RoundsToSeconds(2));
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, RoundsToSeconds(2));

    // 6 - 10
    } else if (nRoll < 11 && !GetIsPC(oTarget)) {
        // faerie fire on target, DC 11
        // replace with polymorph target into chicken
        if(GetMaster(oTarget) != OBJECT_INVALID)
            return; // should not affect henchmen
        effect ePoly = EffectPolymorph(POLYMORPH_TYPE_CHICKEN);
        effect eImp =  EffectVisualEffect(VFX_IMP_POLYMORPH);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                            ePoly,
                            oTarget,
                            RoundsToSeconds(d4()));

    // 11 - 15
    } else if (nRoll < 16) {
        // delude wielder into thinking it's another effect
        int nFakeSpell;
        effect eFakeEffect;
        if (Random(2) == 0) {
            nFakeSpell = SPELL_FIREBALL;
            eFakeEffect = EffectVisualEffect(VFX_FNF_FIREBALL);
        } else {
            nFakeSpell  = SPELL_LIGHTNING_BOLT;
            eFakeEffect = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
        }

        AssignCommand(oCastingObject,
                      ActionCastFakeSpellAtObject(nFakeSpell, oTarget));

        if (nFakeSpell == SPELL_LIGHTNING_BOLT) {
            effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING,
                                    OBJECT_SELF,
                                    BODY_NODE_HAND);
            AssignCommand(oCastingObject,
                ActionDoCommand(
                    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                                        eLightning,
                                        oTarget,
                                        1.0)));
        }

        AssignCommand(oCastingObject,
            ActionDoCommand(
               ApplyEffectToObject(DURATION_TYPE_INSTANT,
                                   eFakeEffect,
                                   oTarget)));

    // 16 - 20
    } else if (nRoll < 21) {
        // windstorm-force gust of wind
        // knock down everyone in the area and play a wind sound
        DoWindstorm(lTargetLoc);

    // 21 - 25
    } else if (nRoll < 26) {
        // fireworks...
        int nRand = Random(4) + 2;
        int i;
        float fDelay;
        effect eVis = EffectVisualEffect(VFX_FNF_MYSTICAL_EXPLOSION);
        for(i = 1; i <= nRand; i++)
        {
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
            fDelay += 3.0;
        }

    // 26 - 30
    } else if (nRoll < 31) {
        // chains sprout from caster to any nearby creature for a few rounds
        int i = 1;
        object oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oCaster, i);
        float fDistance;
        effect eChain = EffectBeam(VFX_BEAM_CHAIN, oCaster, BODY_NODE_CHEST);
        effect eImp = EffectVisualEffect(VFX_COM_HIT_SONIC);
        while(oCreature != OBJECT_INVALID)
        {
            fDistance = GetDistanceBetween(oCaster, oCreature);
            if(fDistance >= 20.0)
                return;
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eChain, oCreature, 18.0);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oCreature);
            i++;
            oCreature = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE, oCaster, i);
        }

    // 31 - 33
    } else if (nRoll < 34) {
        AssignCommand(oCastingObject,
        ActionCastSpellAtObject(SPELL_STORM_OF_VENGEANCE, oCaster, METAMAGIC_ANY, TRUE, 0,
            PROJECTILE_PATH_TYPE_DEFAULT, TRUE));

    // 34 - 36
    } else if (nRoll < 37) {
        // summon penguin, rat, or cow
        DoSillySummon(oTarget);

    // 37 - 43
    } else if (nRoll < 44) {
        // lightning bolt
        int nDamage = d6(6);
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF,
                                              SPELLABILITY_BOLT_LIGHTNING));

        nDamage = GetReflexAdjustedDamage(nDamage,
                                          oTarget,
                                          13,
                                          SAVING_THROW_TYPE_ELECTRICITY);

        //Make a ranged touch attack
        if (nDamage > 0 && TouchAttackRanged(oTarget) > 0) {
            effect eLightning = EffectBeam(VFX_BEAM_LIGHTNING,
                                           oCaster,
                                           BODY_NODE_HAND);
            effect eVis  = EffectVisualEffect(VFX_IMP_LIGHTNING_S);
            effect eBolt = EffectDamage(nDamage, DAMAGE_TYPE_ELECTRICAL);

            //Apply the VFX impact and effects
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eBolt, oTarget);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                                eLightning,
                                oTarget,
                                1.7);
        }

    // 44 - 46
    } else if (nRoll < 47 && !GetIsPC(oCaster)) {
        // polymorph caster into a penguin
       if(GetMaster(oCaster) != OBJECT_INVALID)
            return; // should not affect henchmen
        effect ePoly = EffectPolymorph(POLYMORPH_TYPE_PENGUIN);
        effect eImp =  EffectVisualEffect(VFX_IMP_POLYMORPH);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oCaster);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                            ePoly,
                            oCaster,
                            RoundsToSeconds(d4()));
        SetCustomToken(0, GetName(oCaster));


    // 47 - 49   Butterflies
    } else if (nRoll < 50) {
       ActionCastSpellAtObject(505,
                                    oTarget,
                                    METAMAGIC_ANY, TRUE);
        ActionDoCommand(SetCommandable(TRUE));
        SetCommandable(FALSE);

    // 50 - 53
    } else if (nRoll < 54) {
        // switch caster and target's places (if casting a spell on self then strike with holy strike)
        location lLoc1 = GetLocation(oTarget);
        location lLoc2 = GetLocation(oCaster);
        if(oCaster == oTarget)
        {
            AssignCommand(oCastingObject,
                ActionCastSpellAtObject(SPELL_HAMMER_OF_THE_GODS, oCaster, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
        }
        else
        {
            AssignCommand(oTarget, JumpToLocation(lLoc2));
            AssignCommand(oCaster, JumpToLocation(lLoc1));
        }

    // 54 - 58
    } else if (nRoll < 59) {
        // timestop effect on target
        effect eTimestop = EffectTimeStop();
        effect eVis = EffectVisualEffect(VFX_FNF_TIME_STOP);
        DelayCommand(0.75, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eTimestop, oTarget, 6.0));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));

    // 59 - 62
    } else if (nRoll < 63) {
        // grass grows around caster
        effect eAOE = EffectAreaOfEffect(AOE_PER_ENTANGLE);
        ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY,
                              eAOE,
                              GetLocation(oCaster),
                              RoundsToSeconds(d6()));

    // 63 - 69
    } else if (nRoll < 70) {
        effect eVis = EffectVisualEffect(VFX_DUR_FLIES);
        int nRand = Random(4) + 2;
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, RoundsToSeconds(nRand));

    // 70 - 76
    } else if (nRoll < 77) {
        // fireball
        AssignCommand(oCastingObject,
            ActionCastSpellAtObject(SPELL_FIREBALL,
                                    oTarget,
                                    METAMAGIC_NONE,
                                    TRUE,0,
                                    PROJECTILE_PATH_TYPE_DEFAULT,
                                    TRUE));

    // 77 - 79
    } else if (nRoll < 80 && !GetIsPC(oTarget)) {
        if(GetMaster(oTarget) != OBJECT_INVALID)
            return; // should not affect henchmen
        // polymorph target into a chicken
        effect ePoly = EffectPolymorph(POLYMORPH_TYPE_CHICKEN);
        effect eImp =  EffectVisualEffect(VFX_IMP_POLYMORPH);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eImp, oTarget);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                            ePoly,
                            oTarget,
                            RoundsToSeconds(d4()));
        SetCustomToken(0, GetName(oTarget));


    // 85 - 87
    } else if (nRoll < 88) {
        // leaves grow from target
        // - long-term pixie dust visual effect on caster
        int nEffectPixieDust = 321;
        effect eDust =  EffectVisualEffect(nEffectPixieDust);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                            eDust,
                            oCaster,
                            RoundsToSeconds(d10(3) + 10));

    // 88 - 90
    } else if (nRoll < 91) {
        // Target explodes a fireball every round for a few rounds
        int nDur = Random(2) + 2;
        int i;
        float fDelay;
        for(i = 1; i <= nDur; i++)
        {
            DelayCommand(fDelay,
                AssignCommand(oCastingObject,
                    ActionCastSpellAtObject(SPELL_FIREBALL, oTarget, METAMAGIC_ANY, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE)));
            fDelay += 6.0;
        }

    // 91 - 95
    } else if (nRoll < 96) {
        // shimmering colors blind
        ActionCastFakeSpellAtObject(SPELL_PRISMATIC_SPRAY,
                                    oTarget,
                                    PROJECTILE_PATH_TYPE_DEFAULT);
        DoBlindnessEffect(oCaster, lTargetLoc, 20.0, d4());

    // 96 - 97
    } else {
        // target changes colors every round for 4-9 rounds
        int nDur = Random(6) + 4;
        int i;
        float fDelay;
        int nRand;
        int nEffect;
        effect eVis;
        for(i = 1; i <= nDur; i++)
        {
            nRand = Random(7) + 1;
            if(nRand == 1)      nEffect = VFX_DUR_GLOW_PURPLE;
            else if(nRand == 2) nEffect = VFX_DUR_GLOW_RED;
            else if(nRand == 3) nEffect = VFX_DUR_GLOW_YELLOW;
            else if(nRand == 4) nEffect = VFX_DUR_GLOW_GREEN;
            else if(nRand == 5) nEffect = VFX_DUR_GLOW_ORANGE;
            else if(nRand == 6) nEffect = VFX_DUR_GLOW_BROWN;
            else if(nRand == 7) nEffect = VFX_DUR_GLOW_GREY;

            eVis = EffectVisualEffect(nEffect);
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget, 6.0));
            fDelay += 6.0;

        }

    }

    DestroyObject(oCastingObject, 60.0);
}


/**********************************************************************
 * FUNCTION DEFINITIONS
 * All the individual effect functions are below.
 ***********************************************************/

// Nothing happens message
void DoNothing(object oCaster)
{
    FloatingTextStrRefOnCreature(8848,
                                 oCaster);
}


// Windstorm-force gust of wind effect
void DoWindstorm(location lTarget)
{
    // Play a low thundering sound
    PlaySound("as_wt_thunderds4");

    // Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_SPHERE,
                                           RADIUS_SIZE_HUGE,
                                           lTarget, TRUE,
                                           OBJECT_TYPE_CREATURE |
                                           OBJECT_TYPE_DOOR |
                                           OBJECT_TYPE_AREA_OF_EFFECT);

    // Cycle through the targets within the spell shape
    while (GetIsObjectValid(oTarget)) {

        // Play a random sound
        switch (Random(5)) {
        case 0: AssignCommand(oTarget, PlaySound("as_wt_gustchasm1")); break;
        case 1: AssignCommand(oTarget, PlaySound("as_wt_gustcavrn1")); break;
        case 2: AssignCommand(oTarget, PlaySound("as_wt_gustgrass1")); break;
        case 3: AssignCommand(oTarget, PlaySound("as_wt_guststrng1")); break;
        case 4: AssignCommand(oTarget, PlaySound("fs_floatair")); break;
        }

        // Area-of-effect spells get blown away
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT) {
            DestroyObject(oTarget);
        }

        // * unlocked doors will reverse their open state
        else if (GetObjectType(oTarget) == OBJECT_TYPE_DOOR) {
            if (!GetLocked(oTarget)) {
                if (GetIsOpen(oTarget) == FALSE)
                    AssignCommand(oTarget, ActionOpenDoor(oTarget));
                else
                    AssignCommand(oTarget, ActionCloseDoor(oTarget));
            }
        }

        // creatures will get knocked down, tough fort saving throw
        // to resist.
        else if (GetObjectType(oTarget) == OBJECT_TYPE_CREATURE) {
            if( !FortitudeSave(oTarget, 15) ) {
                effect eKnockdown = EffectKnockdown();
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                                    eKnockdown,
                                    oTarget,
                                    RoundsToSeconds(1));
            }
        }

        // Get the next target within the spell shape.
        oTarget = GetNextObjectInShape(SHAPE_SPHERE,
                                       RADIUS_SIZE_HUGE,
                                       lTarget, TRUE,
                                       OBJECT_TYPE_CREATURE |
                                       OBJECT_TYPE_DOOR |
                                       OBJECT_TYPE_AREA_OF_EFFECT);
    }

}


// Give premonition for a few rounds, up to d4*5 hp
void DoDetectThoughts(object oCaster)
{
    int nRounds = d4();
    int nLimit = nRounds * 5;

    effect ePrem = EffectDamageReduction(30, DAMAGE_POWER_PLUS_FIVE, nLimit);
    effect eVis = EffectVisualEffect(VFX_DUR_PROT_PREMONITION);

    //Link the visual and the damage reduction effect
    effect eLink = EffectLinkEffects(ePrem, eVis);

    //Fire cast spell at event for the specified target
    SignalEvent(oCaster, EventSpellCastAt(oCaster, SPELL_PREMONITION, FALSE));

    //Apply the linked effect
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY,
                        eLink, oCaster, RoundsToSeconds(nRounds));
}

// Summon something extremely silly
void DoSillySummon(object oTarget)
{
    location lTargetLoc = GetOppositeLocation(oTarget);
    int nSummon = d100();
    string sSummon = "";
    if (nSummon < 26) {
        sSummon = "x0_penguin001";
    } else if (nSummon < 51) {
        sSummon = "nw_cow";
    } else {
        sSummon = "nw_deer";
    }

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,
                          EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1),
                          lTargetLoc);

    CreateObject(OBJECT_TYPE_CREATURE, sSummon, lTargetLoc, TRUE);
}


// Do a blindness spell on all in the given radius of a cone for the given
// number of rounds in duration.
void DoBlindnessEffect(object oCaster, location lTarget, float fRadius, int nDuration)
{
    vector vOrigin = GetPosition(oCaster);

    effect eVis = EffectVisualEffect(VFX_IMP_BLIND_DEAF_M);
    effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
    effect eLink = EffectBlindness();
    eLink = EffectLinkEffects(eLink, eDur);

    object oTarget = GetFirstObjectInShape(SHAPE_CONE,
                                           fRadius,
                                           lTarget,
                                           TRUE,
                                           OBJECT_TYPE_CREATURE,
                                           vOrigin);

    while (GetIsObjectValid(oTarget)) {
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF,
                    SPELL_BLINDNESS_AND_DEAFNESS));

        //Do SR check
        if ( !MyResistSpell(OBJECT_SELF, oTarget)) {
            // Make Fortitude save to negate
            if (! MySavingThrow(SAVING_THROW_FORT, oTarget, 13)) {
                //Apply visual and effects
                ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget,
                                    RoundsToSeconds(nDuration));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
        }
        oTarget = GetNextObjectInShape(SHAPE_CONE,
                                           fRadius,
                                           lTarget,
                                           TRUE,
                                           OBJECT_TYPE_CREATURE,
                                           vOrigin);
    }
}



