//::///////////////////////////////////////////////
//:: Name q2dn_use_balista
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
    object oPC = GetLastUsedBy();
    object oSource = GetObjectByTag("source_" + GetTag(OBJECT_SELF));
    //if used by a PC - shoot at any Drow in the Area..
    if (GetIsPC(oPC) == TRUE)
    {                                                                                 //76-80
        if (GetLocalInt(OBJECT_SELF, "nReady") == 1)
        {
            FloatingTextStrRefOnCreature(84136 , oPC);
            return;
        }
        //if the PC fires the Ballista - the gunnery experts will attack the PC.
        object oGunner1 = GetObjectByTag("q2dn_gunner1");
        object oGunner2 = GetObjectByTag("q2dn_gunner2");
        if (GetIsObjectValid(oGunner1) == TRUE)
        {
            AssignCommand(oGunner1, ActionAttack(oPC));
            SetLocalInt(oGunner1, "nAttackPC", 1);

        }
        if (GetIsObjectValid(oGunner2) == TRUE)
        {
            AssignCommand(oGunner2, ActionAttack(oPC));
            SetLocalInt(oGunner2, "nAttackPC", 1);
        }

        //And the Drow Wizard Captain will try to destroy the catapult
        if (GetLocalInt(OBJECT_SELF, "nWizSignal") != 1)
        {
            object oWizard = GetObjectByTag("x2_q2drowwiz3");
            SignalEvent(oWizard, EventUserDefined(199));
            SetLocalInt(OBJECT_SELF, "nWizSignal", 1);
        }
        SignalEvent(oSource, EventUserDefined(101));
        //FireBallista( oPC, 3, 25, SPELL_ISAACS_GREATER_MISSILE_STORM, VFX_IMP_MIRV_FLAME, 78);
        SetLocalInt(OBJECT_SELF, "nReady", 1);
        DelayCommand(12.0, SetLocalInt(OBJECT_SELF, "nReady", 0));
    }
    //else fire at any PCs in the area
    else
    {
        SignalEvent(oSource, EventUserDefined(102));
        //object oTargetArea = GetObjectByTag("tgt_" + GetTag(OBJECT_SELF));
        //FireNPCBallista(oTargetArea, oPC, 2, 5, SPELL_ISAACS_GREATER_MISSILE_STORM, VFX_IMP_MIRV_FLAME, 78);

    }
}
void FireBallista(object oShooter, int nD6Dice, int nCap, int nSpell, int nMIRV = VFX_IMP_MIRV, int nVIS = VFX_IMP_MAGBLUE, int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL, int nONEHIT = FALSE)
{
    //SendMessageToPC(oShooter, "In function");
   //SpawnScriptDebugger();
    object oTarget = OBJECT_INVALID;
    object oSource = GetObjectByTag("source_" + GetTag(OBJECT_SELF));
    int nCasterLvl = 25;
    int nDamage = 0;

    int nCnt = 1;
    effect eMissile = EffectVisualEffect(nMIRV);
    effect eVis = EffectVisualEffect(nVIS);
    float fDist = 0.0;
    float fDelay = 0.0;
    float fDelay2, fTime;
    location lTarget = GetLocation(oSource); // missile spread centered around caster
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
        SendMessageToPCByStrRef(oShooter, 85677);
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

    string szEnemyTag;
    oTarget = GetFirstObjectInArea(oArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget) && nCnt <= nEnemies)
    {
        szEnemyTag = GetStringLeft(GetTag(oTarget), 8);
        // * caster cannot be harmed by this spell
        if (szEnemyTag == "x2_q2dro" || szEnemyTag == "q2bduerg" )
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
                        DelayCommand(fTime, AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget)));
                        DelayCommand(fDelay2, AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget)));

                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        //SendMessageToPC(oShooter, "MISSILES FIRING");

                    }
                    else
                    {  // * apply a dummy visual effect
                     AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
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
    object oSource = GetObjectByTag("source_" + GetTag(OBJECT_SELF));
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
                        DelayCommand(fTime, AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget)));
                        DelayCommand(fDelay2, AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget)));

                        DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                        //SendMessageToPC(oShooter, "MISSILES FIRING");

                    }
                    else
                    {  // * apply a dummy visual effect
                        AssignCommand(oSource, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
                        //SendMessageToPC(oShooter, "MISSILES FIRING2");
                    }
                } // for
                nCnt++;// * increment count of missiles fired
                nRemainder = 0;
        }

        oTarget = GetNextInPersistentObject(oTargetArea);//Shape(SHAPE_SPHERE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_CREATURE);
    }

}
