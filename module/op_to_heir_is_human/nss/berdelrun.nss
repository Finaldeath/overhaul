//::///////////////////////////////////////////////
//:: Conversation
//:: BerdelRun
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint1 = GetObjectByTag("WP_DrowSpawn1");
    object oWaypoint2 = GetObjectByTag("WP_DrowSpawn2");

    location lWaypoint1 = GetLocation(oWaypoint1);
    location lWaypoint2 = GetLocation(oWaypoint2);

    CreateObject(OBJECT_TYPE_CREATURE,"nw_drowfight010",lWaypoint1);
    CreateObject(OBJECT_TYPE_CREATURE,"nw_drowfight010",lWaypoint2);

    ActionStartConversation(OBJECT_SELF);
}
