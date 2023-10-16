//::///////////////////////////////////////////////
//:: Conversation
//:: AmionOpen
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: June 14, 2002
//:://////////////////////////////////////////////

void main()
{
    object oDoor = GetObjectByTag("CorToFor");
    object oWaypoint = GetObjectByTag("WP_Amion");

    ActionOpenDoor(oDoor);
    ActionMoveToObject(oWaypoint);
}
