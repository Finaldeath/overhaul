//::///////////////////////////////////////////////
//:: Blade Barrier: Heartbeat
//:: NW_S0_BladeBarA.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a wall 10m long and 2m thick of whirling
    blades that hack and slice anything moving into
    them.  Anything caught in the blades takes
    2d6 per caster level.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: July 20, 2001
//:://////////////////////////////////////////////

#include "X0_I0_SPELLS"
#include "x2_inc_spellhook"

void main()
{
    object oTarget;
    effect eDam;
    effect eVis = EffectVisualEffect(VFX_COM_BLOOD_LRG_RED);

    oTarget = GetFirstInPersistentObject();
    while(GetIsObjectValid(oTarget))
    {
        int nDamage = d6(6);
        if(MySavingThrow(SAVING_THROW_REFLEX, oTarget, 18))
        {
            nDamage = d6(3);
        }
        eDam = EffectDamage(nDamage, DAMAGE_TYPE_SLASHING);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
       oTarget = GetNextInPersistentObject();
     }
}

