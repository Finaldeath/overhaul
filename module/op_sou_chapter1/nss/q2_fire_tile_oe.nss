//::///////////////////////////////////////////////
//:: fire flagstone effect from the flagstone puzzle
//:: q2_fire_tile_oe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Inflict damage to player when the amulet is still on the pedestal. Otherwise - it is safe passage.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    int nAcidFlagDC = 14;
    object oTarget = GetEnteringObject();
    if (GetIsDM(oTarget) == FALSE)
    {
        effect eDam = EffectDamage(d6(2), DAMAGE_TYPE_FIRE);
        effect eVis = EffectVisualEffect(VFX_IMP_FLAME_S);
        int nDamage;

        if(GetLocalInt(GetArea(OBJECT_SELF), "FLAGSTONES_STATUS") == 1)
            return; // path is safe in this case

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    }
}
