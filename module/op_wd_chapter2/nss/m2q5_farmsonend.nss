//::///////////////////////////////////////////////
//:: Conversation End
//:: m2q5_farmsonEnd
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Move back to the waypoint after conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: April 17, 2002
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint  = GetObjectByTag("WP_M2Q5_FARMSON");

    ActionForceMoveToObject(oWaypoint);
}
