//::///////////////////////////////////////////////
//:: Remove Planar Creatures
//:: 2q4d_portalend
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Goes through the area and removes instances
    of various creatures.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: April 10
//:://////////////////////////////////////////////
#include "nw_i0_plot"
void DestroyPlanarCreature(string sTag);

void main()
{
    object oItem1 = GetItemPossessedBy(GetPCSpeaker(),"2Q4_GlowSphere");
    object oItem2 = GetItemPossessedBy(GetPCSpeaker(),"2Q4_PlanarToken");
    if (GetIsObjectValid(oItem1))
    {
        DestroyObject(oItem1);
    }
    else DestroyObject(oItem2);

    object oPortal = GetObjectByTag("2Q4D_PlanarPort");
    //SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4D_INFIGHTING",1);

    //AdjustReputation(OBJECT_SELF,oPortal , -100);
    //AdjustReputation(oRak, oKurth, -100);
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    effect eShake = EffectVisualEffect(VFX_FNF_SCREEN_SHAKE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eShake, GetLocation(oPortal));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis, GetLocation(oPortal));
    DestroyObject(oPortal, 0.5);
    DestroyPlanarCreature("2Q4D_RAKSHASA");
    DestroyPlanarCreature("2Q4D_Succubus");
    DestroyPlanarCreature("2Q4D_Vrock");
    DestroyPlanarCreature("2Q4D_HellHound");
    DestroyPlanarCreature("2Q4D_Imp");
    //add final effect for the portal and destroy it

    RewardXP("2q6e_golem_made",100, GetPCSpeaker());
}

void DestroyPlanarCreature(string sTag)
{
    object oTarget = GetNearestObjectByTag(sTag);
    if(GetIsObjectValid(oTarget))
    {
        DestroyObject(oTarget);
        DelayCommand(0.1, DestroyPlanarCreature(sTag));
    }
}
