//::///////////////////////////////////////////////
//:: Tigger Script: Christer
//:: TR_Christer
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Command Christer to move to the nearby
    waypoint.
*/
//:://////////////////////////////////////////////

void main()
{
    object oChrister = GetObjectByTag("Christer");
    object oWaypoint = GetObjectByTag("WP_Christer");

    AssignCommand(oChrister, ActionMoveToObject(oWaypoint));
}
