//::///////////////////////////////////////////////
//:: Portal Trigger On Enter
//:: 2Q4D_PORTAL_ENTE
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    When the character enters the portal area
    with the sphere and the token the portal
    destructs.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 16, 2002
//:://////////////////////////////////////////////

#include "NW_I0_2Q4LUSKAN"
void main()
{
    object oToken = GetItemPossessedBy(GetEnteringObject(), "2Q4_PlanarToken");
    object oGlow = GetItemPossessedBy(GetEnteringObject(), "2Q4_GlowSphere");
    object oPortal = GetObjectByTag("2Q4D_PlanarPort");
    SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4D_INFIGHTING",1);
    //object oKurth = GetObjectByTag("2Q4D_Kurth");
    //object oRak = GetObjectByTag("2Q4D_RAKSHASA");

    if(GetIsObjectValid(oToken) && GetIsObjectValid(oGlow))
    {
        AdjustReputation(OBJECT_SELF,oPortal , -100);
        //AdjustReputation(oRak, oKurth, -100);
        effect eVis = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT,eVis, GetLocation(oPortal));
        DestroyObject(oPortal, 0.5);
        DestroyObject(oToken,0.1);
        DestroyObject(oGlow, 0.1);
    }
}
