//::///////////////////////////////////////////////
//:: Perin Spawn Script #1
//:: PerinSpawn01
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Causes the recently spawned Perin to walk his
    waypoints.
*/
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    object oPerin = GetObjectByTag("Perin");

    DelayCommand(1.0, AssignCommand(oPerin, WalkWayPoints()));
}
