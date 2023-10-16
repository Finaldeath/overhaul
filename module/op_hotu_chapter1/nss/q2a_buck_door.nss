//::///////////////////////////////////////////////
//:: Name: q2a_buck_door
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Grayban will open the door to the Waterdeep
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 7/02
//:://////////////////////////////////////////////
#include "inc_plot_locals"
void main()
{
    object oDoor = GetObjectByTag("q2a_yp_int");
    location lPost = GetLocation(GetObjectByTag("wp_q2agrayban"));
    SetLocked(oDoor, FALSE);
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
    AssignCommand(OBJECT_SELF, ActionMoveToLocation(lPost));
    DelayCommand(10.0, SetFacingPoint(GetPosition(GetWaypointByTag("q2a_mapnote1"))));

    BuckOpenedDoor(GetPCSpeaker());
}
