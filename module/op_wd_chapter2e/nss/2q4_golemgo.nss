//::///////////////////////////////////////////////
//:: Make the Golem Fight
//:: 2q4_GolemGo
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Make the golem not plot and have the golem
    attack.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March 28, 2002
//:://////////////////////////////////////////////
#include "nw_i0_generic"
#include "nw_i0_2q4luskan"
void main()
{
    int nLocal = GetLocalPlotIntFromCharacter(OBJECT_SELF);
    if(nLocal == 0)
    {
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        SpeakOneLinerConversation();
        object oWay = GetWaypointByTag("2q4_golem_spawn");
        effect eVis = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oWay));
        CreateObject(OBJECT_TYPE_CREATURE, "nw_golflesh002", GetLocation(oWay));
        SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
    }
}
