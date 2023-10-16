//::///////////////////////////////////////////////
//:: Spawn
//:: m2q3Boy_9
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Maryweather's son walks over to his starting
    point.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 28, 2001
//:://////////////////////////////////////////////

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q3BOYWALK");

    ActionMoveToObject(oWaypoint);
    ActionDoCommand(SetFacing(GetFacing(oWaypoint)));
    DelayCommand(60.0,SetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken",0));
}
