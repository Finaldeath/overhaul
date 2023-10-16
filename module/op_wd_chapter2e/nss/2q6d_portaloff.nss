//::///////////////////////////////////////////////
//:: Turn Off Portal
//:: 2Q6D_PortalOff
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    This turns off the portal on Level 3 of the
    host tower by detecting when Imp or Quasit parts
    are placed in the right container.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 24, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
void main()
{
    object oItem = GetInventoryDisturbItem();
    string sTag = GetTag(OBJECT_SELF);
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL);
    if(sTag == "2Q6D_AbyssPortal")
    {
        if(GetTag(oItem) == "2Q6_ImpGore")
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
            DestroyObject(OBJECT_SELF, 0.5);
        }
    }
    else if(sTag == "2Q6D_HellPortal")
    {
        if(GetTag(oItem) == "2Q6_QuasitGore")
        {
            ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(OBJECT_SELF));
            DestroyObject(OBJECT_SELF, 0.5);
        }
    }
}
