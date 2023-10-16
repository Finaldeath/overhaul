
//::///////////////////////////////////////////////////
//:: X0_TRAPAVG_MMISS
//:: OnTriggered script for a projectile trap
//:: Spell fired: SPELL_MAGIC_MISSILE
//:: Spell caster level: 4
//::
//:: Copyright (c) 2002 Floodgate Entertainment
//:: Created By: Naomi Novik
//:: Created On: 11/17/2002
//::///////////////////////////////////////////////////

#include "x0_i0_projtrap"

void Missile(object oTarget)
{
    //Declare major variables  ( fDist / (3.0f * log( fDist ) + 2.0f) )
    //object oTarget = GetSpellTargetObject();
    int nCasterLvl = 1;
    int nDamage = 0;
    int nCnt;
    effect eMissile = EffectVisualEffect(VFX_IMP_MIRV);
    effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
    int nMissiles = (nCasterLvl + 1)/2;
    float fDist = GetDistanceBetween(OBJECT_SELF, oTarget);
    float fDelay = fDist/(3.0 * log(fDist) + 2.0);
    float fDelay2, fTime;

        if (nMissiles > 5)
        {
            nMissiles = 5;
        }
        //Make SR Check

            //Apply a single damage hit for each missile instead of as a single mass
            for (nCnt = 1; nCnt <= nMissiles; nCnt++)
            {
                //Roll damage
                int nDam = d4(1) + 1;
                //Enter Metamagic conditions

                fTime = fDelay;
                fDelay2 += 0.1;
                fTime += fDelay2;

                //Set damage effect
                effect eDam = EffectDamage(nDam, DAMAGE_TYPE_MAGICAL);
                //Apply the MIRV and damage effect
                DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                DelayCommand(fTime, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget));
                DelayCommand(fDelay2, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
             }

}
void main()
{
    int n = 1;
    effect eMissile = EffectVisualEffect(VFX_IMP_MIRV);
    effect eVis = EffectVisualEffect(VFX_IMP_MAGBLUE);
    int nDam;
    effect eDam;
    object oTarget = GetEnteringObject();

    object oGarg = GetNearestObjectByTag("Q3B_STATUE_TRAP", OBJECT_SELF, n);

    while(oGarg != OBJECT_INVALID)
    {
        float fDistance = GetDistanceBetween(OBJECT_SELF, oGarg);
        if(fDistance > 20.0)
            return;
        nDam = d4(1) + 1;
        eDam = EffectDamage(nDam);
        //DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        //DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVis, oTarget));
        //DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eMissile, oTarget));
        AssignCommand(oGarg, Missile(oTarget));

        n++;
        oGarg = GetNearestObjectByTag("Q3B_STATUE_TRAP", OBJECT_SELF, n);
    }


}

