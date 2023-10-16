//
//::///////////////////////////////////////////////
//:: Name q2dn_ud_balsource
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Firing the Ballista will rain down destruction
    on the Drow Camp below..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 25
//:://////////////////////////////////////////////

#include "x0_i0_spells"
void FireBallista(object oShooter, int nD6Dice, int nCap, int nSpell, int nMIRV = VFX_IMP_MIRV, int nVIS = VFX_IMP_MAGBLUE, int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL, int nONEHIT = FALSE);
void FireNPCBallista(object oTargetArea, object oShooter, int nD6Dice, int nCap, int nSpell, int nMIRV = VFX_IMP_MIRV, int nVIS = VFX_IMP_MAGBLUE, int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL, int nONEHIT = FALSE);

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 101)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        FireBallista( oPC, 3, 25, SPELL_ISAACS_GREATER_MISSILE_STORM, VFX_IMP_MIRV_FLAME, 78);
        PlaySound("sim_shwngcold01");
    }
    else if (nEvent == 102)
    {
        object oPC = GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE);
        object oTargetArea = GetObjectByTag("tgt_" + GetStringRight(GetTag(OBJECT_SELF),14));
        FireNPCBallista(oTargetArea, oPC, 2, 5, SPELL_ISAACS_GREATER_MISSILE_STORM, VFX_IMP_MIRV_FLAME, 78);
        PlaySound("sim_shwngcold01");
    }
}
void FireBallista(object oShooter, int nD6Dice, int nCap, int nSpell, int nMIRV = VFX_IMP_MIRV, int nVIS = VFX_IMP_MAGBLUE, int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL, int nONEHIT = FALSE)
{
    //SendMessageToPC(oShooter, "In function");
   //SpawnScriptDebugger();
    object oTarget = OBJECT_INVALID;

    int nCasterLvl = 25;
    int nDamage = 0;

    int nCnt = 1;
    effect eMissile = EffectVisualEffect(nMIRV);
    effect eVis = EffectVisualEffect(nVIS);
    float fDist = 0.0;
    float fDelay = 0.0;
    float fDelay2, fTime;
    location lTarget = GetLocation(OBJECT_SELF); // missile spread centered around caster
    int nMissiles = nCasterLvl;

    if (nMissiles > nCap)
    {
        nMissiles = nCap;
    }

        /* New Algorithm
            1. Count # of targets
            2. Determine number of missiles
            3. First target gets a missile and all Excess missiles
            4. Rest of targets (max nMissiles) get one missile
       */
    int nEnemies = 0;

    object oArea = GetArea(oShooter);
    oTarget = GetFirstObjectInArea(oArea);//GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    string szTagSelf;
    while (GetIsObjectValid(oTarget) == TRUE )
    {
        szTagSelf = GetStringLeft(GetTag(oTarget), 8);
        // * caster cannot be harmed by this spell
        if ( szTagSelf == "x2_q2dro" || szTagSelf == "q2bduerg")
        {
            nEnemies++;
        }
        oTarget = GetNextObjectInArea(oArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
     }

     if (nEnemies == 0)
     {
        SendMessageToPCByStrRef(oShooter, 84150 );
        return; // * Exit if no enemies to hit
     }
     int nExtraMissiles = nMissiles / nEnemies;

     // April 2003
     // * if more enemies than missiles, need to make sure that at least
     // * one missile will hit each of the enemies
     if (nExtraMissiles <= 0)
     {
        nExtraMissiles = 1;
     }

     // by default the Remainder will be 0 (if more than enough enemies for all the missiles)
     int nRemainder = 0;

     if (nExtraMissiles >0)
        nRemainder = nMissiles % nEnemies;

     if (nEnemies > nMissiles)
        nEnemies = nMissiles;

    //DEBUG
    //SendMessageToPC(oShooter, "Number of enemies: " + IntToString(nEnemies));
    oTarget = GetFirstObjectInArea(oArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    string szTargetTag;

    while (GetIsObjectValid(oTarget) && nCnt <= nEnemies)
    {
        szTargetTag = GetStringLeft(GetTag(oTarget), 8);
        //SendMessageToPC(oShooter, "Enemy valid");
        // * caster cannot be harmed by this spell
        if (szTargetTag == "x2_q2dro" || szTargetTag == "q2bduerg")
        {
                //SendMessageToPC(oShooter, "Enemy TARGET valid");
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, nSpell));

                // * recalculate appropriate distances

                fDist = GetDistanceBetween(OBJECT_SELF, oTarget);
                fDelay = fDist/(3.0 * log(fDist) + 2.0);

                // Firebrand.
                // It means that once the target has taken damage this round from the
                // spell it won't take subsequent damage
                if (nONEHIT == TRUE)
                {
                    nExtraMissiles = 1;
                    nRemainder = 0;
                }

                int i = 0;
                // * first target will get excess missiles
                for (i=1; i <= nExtraMissiles + nRemainder; i++)
                {
                    //Make SR Check
                    if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
                    {
                        //Roll damage
                        int nDam = d6(nD6Dice);

                        fTime = fDelay;
                        fDelay2 += 0.1;
                        fTime += fDelay2;

                        //Set damage effect
                        effect eDam = EffectDamage(nDam, nDAMAGETYPE);
                        //Apply the MIRV and damage effect
                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget));
                        DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));

                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        //SendMessageToPC(oShooter, "MISSILES FIRING");

                    }
                    else
                    {  // * apply a dummy visual effect
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget);
                        //SendMessageToPC(oShooter, "MISSILES FIRING2");
                    }
                } // for
                nCnt++;// * increment count of missiles fired
                nRemainder = 0;
        }

        oTarget = GetNextObjectInArea(oArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    }

}

void FireNPCBallista(object oTargetArea, object oShooter, int nD6Dice, int nCap, int nSpell, int nMIRV = VFX_IMP_MIRV, int nVIS = VFX_IMP_MAGBLUE, int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL, int nONEHIT = FALSE)
{
    //SendMessageToPC(oShooter, "In function");
   //SpawnScriptDebugger();
    object oTarget = OBJECT_INVALID;

    int nCasterLvl = 5;
    int nDamage = 0;

    int nCnt = 1;
    effect eMissile = EffectVisualEffect(nMIRV);
    effect eVis = EffectVisualEffect(nVIS);
    float fDist = 0.0;
    float fDelay = 0.0;
    float fDelay2, fTime;
    location lTarget = GetLocation(OBJECT_SELF); // missile spread centered around caster
    int nMissiles = nCasterLvl;

    if (nMissiles > nCap)
    {
        nMissiles = nCap;
    }

        /* New Algorithm
            1. Count # of targets
            2. Determine number of missiles
            3. First target gets a missile and all Excess missiles
            4. Rest of targets (max nMissiles) get one missile
       */
    int nEnemies = 0;

    object oArea = GetArea(oShooter);
    oTarget = GetFirstInPersistentObject(oTargetArea);//GetFirstObjectInShape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget) == TRUE )
    {
        // * caster cannot be harmed by this spell
        if (GetIsPC(oTarget) == TRUE)
        {
            nEnemies++;
        }
        oTarget = GetNextInPersistentObject(oTargetArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
     }

     if (nEnemies == 0)
     {

        return; // * Exit if no enemies to hit
     }
     int nExtraMissiles = nMissiles / nEnemies;

     // April 2003
     // * if more enemies than missiles, need to make sure that at least
     // * one missile will hit each of the enemies
     if (nExtraMissiles <= 0)
     {
        nExtraMissiles = 1;
     }

     // by default the Remainder will be 0 (if more than enough enemies for all the missiles)
     int nRemainder = 0;

     if (nExtraMissiles >0)
        nRemainder = nMissiles % nEnemies;

     if (nEnemies > nMissiles)
        nEnemies = nMissiles;

    //DEBUG
    //SendMessageToPC(oShooter, "Number of enemies: " + IntToString(nEnemies));
    oTarget = GetFirstInPersistentObject(oTargetArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget) && nCnt <= nEnemies)
    {
        //SendMessageToPC(oShooter, "Enemy valid");
        // * caster cannot be harmed by this spell
        if (GetIsPC(oTarget) == TRUE)
        {
                //SendMessageToPC(oShooter, "Enemy TARGET valid");
                //Fire cast spell at event for the specified target
                SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, nSpell));

                // * recalculate appropriate distances

                fDist = GetDistanceBetween(OBJECT_SELF, oTarget);
                fDelay = fDist/(3.0 * log(fDist) + 2.0);

                // Firebrand.
                // It means that once the target has taken damage this round from the
                // spell it won't take subsequent damage
                if (nONEHIT == TRUE)
                {
                    nExtraMissiles = 1;
                    nRemainder = 0;
                }

                int i = 0;
                // * first target will get excess missiles
                for (i=1; i <= nExtraMissiles + nRemainder; i++)
                {
                    //Make SR Check
                    if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
                    {
                        //Roll damage
                        int nDam = d6(nD6Dice);

                        fTime = fDelay;
                        fDelay2 += 0.1;
                        fTime += fDelay2;

                        //Set damage effect
                        effect eDam = EffectDamage(nDam, nDAMAGETYPE);
                        //Apply the MIRV and damage effect
                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget));
                        DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));

                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        //SendMessageToPC(oShooter, "MISSILES FIRING");

                    }
                    else
                    {  // * apply a dummy visual effect
                        ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget);
                        //SendMessageToPC(oShooter, "MISSILES FIRING2");
                    }
                } // for
                nCnt++;// * increment count of missiles fired
                nRemainder = 0;
        }

        oTarget = GetNextInPersistentObject(oTargetArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    }

}
