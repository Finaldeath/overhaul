//::///////////////////////////////////////////////
//:: Name crypt_use_coffin
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
//Create a revenant when the crypt is disturbed
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 24/03
//:://////////////////////////////////////////////

#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDoOnce") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDoOnce", 1);
        location lTarget = GetLocation(GetWaypointByTag("wp_crypt_rev1"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_UNDEAD), lTarget);
        object oRev = CreateObject(OBJECT_TYPE_CREATURE, "nw_revenant001", lTarget);
        AssignCommand(oRev, DetermineCombatRound());
    }
}
