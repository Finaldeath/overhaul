//::///////////////////////////////////////////////
//:: Name: q2e_exit_beartrg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    If a bear tries to exit this trigger is should
    be sent back - try to keep the mayhem a little
    more controlled
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Jan 15/03
//:://////////////////////////////////////////////

void main()
{
    if (GetTag(GetExitingObject()) == "q2ebear")
    {
        AssignCommand(GetExitingObject(), ActionMoveToLocation(GetLocation(GetWaypointByTag("q2e_bearspn_1"))));
        SetLocalInt(GetExitingObject(), "nBusy", 1);
        DelayCommand(20.0, SetLocalInt(GetExitingObject(), "nBusy", 0));
    }
}
