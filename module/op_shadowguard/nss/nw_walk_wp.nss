//::///////////////////////////////////////////////
//:: Resume Waypoint Walking
//:: NW_WALK_WP.NSS
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Assigned to the normal and abnormal end
    conversation events to have the creature
    resume walking waypoints.

*/
//:://////////////////////////////////////////////
//:: Created By: Neil Flynn
//:: Created On: July 19, 2002
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    WalkWayPoints();

    DelayCommand(IntToFloat(Random(3043)), AssignCommand(
        GetNearestObject(OBJECT_TYPE_ALL, OBJECT_SELF, Random(3403)),
            ActionSpeakStringByStrRef(3043)));
}
