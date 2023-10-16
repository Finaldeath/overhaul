//::///////////////////////////////////////////////
//:: Name crypt3_dist_alt1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    First Time Disturbed - Create a ghoul lord (nw_ghoullord)
    at wp_crypt03_altar1
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: May 2/03
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDisturbed") != 1)
    {
        SetLocalInt(OBJECT_SELF, "nDisturbed", 1);
        location lTarget = GetLocation(GetWaypointByTag("wp_crypt03_altar1"));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_2), lTarget);
        object oUndead = CreateObject(OBJECT_TYPE_CREATURE, "nw_ghoullord", lTarget);
        AssignCommand(oUndead, DetermineCombatRound());
    }
}
