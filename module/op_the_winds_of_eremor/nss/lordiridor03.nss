//::///////////////////////////////////////////////
//:: Lord Iridor Conversation Script #3
//:: lordiridor_03
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Sets Lord Iridor's "Talked" local to 1 and
    him to return to his waypoint pacing.
*/
//:://////////////////////////////////////////////

#include "NW_I0_GENERIC"

void main()
{
    SetLocalInt(OBJECT_SELF, "IridorTalked", 1);
    WalkWayPoints();
}
