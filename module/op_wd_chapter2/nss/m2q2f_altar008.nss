//::///////////////////////////////////////////////
//:: Conversation
//:: m2q2f_altar008
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A dire bear is summoned.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: May 22, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q2F_ALTAR");
    location lWaypoint = GetLocation(oWaypoint);

    CreateObject(OBJECT_TYPE_CREATURE,"beardireboss001",lWaypoint,TRUE);
}
