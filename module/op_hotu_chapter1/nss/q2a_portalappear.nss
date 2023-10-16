//::///////////////////////////////////////////////
//:: Name q2a_portalappear
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Appear effect for wandering monsters at portals
    in level 1 of undermountain
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 9/03
//:://////////////////////////////////////////////

#include "x2_inc_restsys"
void main()
{
    int nEvent = GetUserDefinedEventNumber();

    // if this is the special WM Spawn Event
    //Create a flashy Teleport effect
    if (nEvent == X2_WM_SPAWNSPOT_EVENTID)
    {
       effect eAppear = EffectVisualEffect(VFX_FNF_DISPEL);
       effect eBoom =   EffectVisualEffect(VFX_FNF_SMOKE_PUFF);
       eAppear = EffectLinkEffects(eBoom,eAppear);
       ApplyEffectToObject(DURATION_TYPE_INSTANT,eAppear, OBJECT_SELF);

    }
}





