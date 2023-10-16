//::///////////////////////////////////////////////
//:: Sanctum Door On Death
//:: 2q6_sanctum_7
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the sanctum door dies play a visual effect
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 22, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
void main()
{
    location lLocal = GetLocation(OBJECT_SELF);

    effect eVis = EffectVisualEffect(VFX_FNF_PWSTUN);

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal);

    object oHelm = GetNearestObjectByTag("2Q6_HelmHorror");
    if(GetIsObjectValid(oHelm))
    {
        AssignCommand(oHelm, WalkWayPoints());
    }
}
