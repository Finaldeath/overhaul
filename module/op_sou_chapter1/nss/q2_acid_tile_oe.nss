//::///////////////////////////////////////////////
//:: Acid flagstone on-enter in the flagstones puzzle
//:: q2_acid_tile_oe
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Apply damage to player only if amulet is not in its place and jump player back to center.
*/
//:://////////////////////////////////////////////
//:: Created By: Yaron
//:: Created On: 6/2/2003
//:://////////////////////////////////////////////


#include "NW_I0_SPELLS"

void main()
{
    //Declare major variables
    object oTarget = GetEnteringObject();
    if (GetIsDM(oTarget) == FALSE)
    {
        effect eDam = EffectDamage(d6(2), DAMAGE_TYPE_ACID);
        effect eVis = EffectVisualEffect(VFX_IMP_ACID_S);
        int nDamage;

        if(GetLocalInt(GetArea(OBJECT_SELF), "FLAGSTONES_STATUS") == 0)
            return; // path is safe in this case

        ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
        object oJump = GetNearestObjectByTag("Q2_AMULET_PEDESTAL");
        AssignCommand(oTarget, JumpToObject(oJump));
    }

}
