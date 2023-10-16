//::///////////////////////////////////////////////
//:: Name: x2_inc_traps
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Include File for special traps.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 14/02
//:://////////////////////////////////////////////

// * Sample script to cast an existing spell as is
#include "x0_i0_spells"
void DoTrapMissileStorm(object oTarget)
{

    int nMIRV = VFX_IMP_MIRV;
    int nVIS = VFX_IMP_MAGBLUE;
    int nDAMAGETYPE = DAMAGE_TYPE_MAGICAL;
    int nD6Dice = 1;
    int nDamage = 0;

    int nCnt = 1;
    effect eMissile = EffectVisualEffect(nMIRV);
    effect eVis = EffectVisualEffect(nVIS);
    float fDist = 0.0;
    float fDelay = 0.0;
    float fDelay2, fTime;
    location lTarget = GetLocation(oTarget); // missile spread centered around caster
    int nMissiles = 10;

        /* New Algorithm
            1. Count # of targets
            2. Determine number of missiles
            3. First target gets a missile and all Excess missiles
            4. Rest of targets (max nMissiles) get one missile
       */

    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_ISAACS_GREATER_MISSILE_STORM));

    // * recalculate appropriate distances

    fDist = GetDistanceBetween(OBJECT_SELF, oTarget);
    fDelay = fDist/(3.0 * log(fDist) + 2.0);

    int i = 0;
    // * first target will get excess missiles
    for (i=1; i <= nMissiles; i++)
    {
    //Make SR Check
        if (!MyResistSpell(OBJECT_SELF, oTarget, fDelay))
        {
            //Roll damage
            int nDam = d3(nD6Dice);

            fTime = fDelay;
            fDelay2 += 0.1;
            fTime += fDelay2;

            //Set damage effect
            effect eDam = EffectDamage(nDam, nDAMAGETYPE);
            //Apply the MIRV and damage effect
            DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget));
            DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
            DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));

        }
        else
        {  // * apply a dummy visual effect
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget);
        }
    } // for

}
void DoSpecialTrap(int nSpell)
{
    object oOrigin = GetNearestObjectByTag( GetTag(OBJECT_SELF) );
    object oTarget = GetEnteringObject();

    if (GetIsObjectValid(oOrigin) == FALSE)
    {
        oOrigin = OBJECT_SELF;
    }

    //SpeakString( GetName(oOrigin) + " -> " + GetName( oTarget ) );

    AssignCommand( oOrigin, ActionCastSpellAtObject(nSpell, oTarget, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE) );
}

void DoSpecialTrapHB(int nSpell)
{
   object oOrigin = GetNearestObjectByTag( GetTag(OBJECT_SELF) );
   object oTarget = GetFirstInPersistentObject();
   while (oTarget != OBJECT_INVALID)
   {
        if (GetIsObjectValid(oOrigin) == FALSE)
        {
            oOrigin = OBJECT_SELF;
        }
        AssignCommand( oOrigin, ActionCastSpellAtObject(nSpell, oTarget, TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE) );
        oTarget = GetNextInPersistentObject();
   }
}

void DoMazeTrapHB()
{
    object oOrigin = GetNearestObjectByTag( GetTag(OBJECT_SELF) );
    object oTarget = GetFirstInPersistentObject();
    while (oTarget != OBJECT_INVALID)
    {
        if (GetIsObjectValid(oOrigin) == FALSE)
        {
            oOrigin = OBJECT_SELF;
        }
        AssignCommand( oOrigin, DoTrapMissileStorm(oTarget));
        oTarget = GetNextInPersistentObject();
    }
}
void DoMazeTrap()
{
    object oOrigin = GetNearestObjectByTag( GetTag(OBJECT_SELF) );
    object oTarget = GetEnteringObject();

    if (GetIsObjectValid(oOrigin) == FALSE)
    {
        oOrigin = OBJECT_SELF;
    }

    //SpeakString( GetName(oOrigin) + " -> " + GetName( oTarget ) );

    AssignCommand( oOrigin, DoTrapMissileStorm(oTarget));
}






