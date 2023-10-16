//::///////////////////////////////////////////////
//:: Name: q2d_death_strap2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
When these skulls are destroyed - it stops special
trap 2 on Level 3 Undermountain
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 20/02
//:://////////////////////////////////////////////

void main()
{
    SetLocalInt(GetModule(), "nSpecTrap2Active", 0);
    SetLocalInt(GetModule(), "X2_nSTRAP2DESTROYED", 1);
    location lTarget = GetLocation(GetObjectByTag("q2d_ped_central"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectLinkEffects(EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), EffectVisualEffect(VFX_FNF_FIRESTORM)), lTarget);
}
