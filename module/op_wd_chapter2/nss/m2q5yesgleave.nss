//::///////////////////////////////////////////////
//:: LeaveRun
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Does an escape area to a waypoint named NW_EXIT
  by running.
*/
//:://////////////////////////////////////////////
//:: Created By:     Kevin
//:: Created On:     January, 2002
//:://////////////////////////////////////////////
#include "NW_I0_PLOT"

void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_YESGARLEAVES",10);
    ActionMoveAwayFromObject(GetPCSpeaker());
    DelayCommand(10.0,DestroyObject(OBJECT_SELF));
    SetCommandable(FALSE);
}

