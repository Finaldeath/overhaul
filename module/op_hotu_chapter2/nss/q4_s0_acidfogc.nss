//::///////////////////////////////////////////////
//:: Acid Fog: Heartbeat
//:: NW_S0_AcidFogC.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    All creatures within the AoE take 2d6 acid damage
    per round and upon entering if they fail a Fort Save
    their movement is halved.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 17, 2001
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{
    int nDamage = d6(3);
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
    object oTarget;
    float fDelay;

    eDam = EffectDamage(nDamage, DAMAGE_TYPE_ACID);
    //Start cycling through the AOE Object for viable targets including doors and placable objects.
    oTarget = GetFirstInPersistentObject(OBJECT_SELF);
    while(GetIsObjectValid(oTarget))
    {
        if(!MySavingThrow(SAVING_THROW_FORT, oTarget, 24, SAVING_THROW_TYPE_ACID, GetAreaOfEffectCreator(), fDelay))
              nDamage = d6(3);
        fDelay = GetRandomDelay(0.4, 1.2);
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
        DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));

        //Get next target.
        oTarget = GetNextInPersistentObject(OBJECT_SELF);
    }
}
