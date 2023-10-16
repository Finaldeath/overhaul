//::///////////////////////////////////////////////
//:: Spawn
//:: m2q3Mary_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Maryweather walk over to her starting point.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3MARYWALK");

    ActionMoveToObject(oWaypoint);
    ActionDoCommand(SetFacing(GetFacing(oWaypoint)));
}
