//::///////////////////////////////////////////////
//:: Give Reward from Nyphithys
//:: 2Q6_NYPHITHYS
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This script will add the item reward
    as well as the teleportation effect
    when Nyphithys leaves
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 26, 2002
//:://////////////////////////////////////////////

// this script will have to be edited to add the item reward
// as well as the teleportation effect when Nyphithys leaves

#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(GetModule(),"NYPHITHYS_IS_FREE",1);
    CreateItemOnObject("NW_IT_MNECK017",GetPCSpeaker());
    effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
    DestroyObject(OBJECT_SELF, 0.5);
}
