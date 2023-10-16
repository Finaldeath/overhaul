//::///////////////////////////////////////////////
//:: Conversation
//:: M2Q3K_PortalOff
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 26, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3K_Portal");

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT,EffectVisualEffect(VFX_FNF_DISPEL_GREATER),GetLocation(oWaypoint));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SKELWARR01",GetLocation(oWaypoint));
    CreateObject(OBJECT_TYPE_CREATURE,"NW_SKELWARR01",GetLocation(oWaypoint));
}
