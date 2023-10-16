//::///////////////////////////////////////////////
//:: Heartbeat
//:: m2CutlassH
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 19, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_TAG_HOME");
    object oKid;
    location lWaypoint = GetLocation(oWaypoint);

    // Spawn the kids playing tag at dawn.
    if (GetLocalInt(OBJECT_SELF,"NW_Spawn_Tag_Game") == 0 &&
        GetIsDay())
    {
        SetLocalInt(OBJECT_SELF,"NW_Spawn_Tag_Game",1);
        CreateObject(OBJECT_TYPE_CREATURE,"nw_tag_child",lWaypoint);
        CreateObject(OBJECT_TYPE_CREATURE,"nw_tag_child",lWaypoint);
        CreateObject(OBJECT_TYPE_CREATURE,"nw_tag_child",lWaypoint);
        oKid = CreateObject(OBJECT_TYPE_CREATURE,"nw_tag_child",lWaypoint);
        SetLocalObject(OBJECT_SELF,"NW_A_TAG_I_AM_IT",oKid);
    }
}
