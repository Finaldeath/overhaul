// Musharak and his guard leave.

#include "x1_inc_plot"

void main()
{
    object oWP = GetWaypointByTag("Q5A_WP_MUSHY_EXIT");
    object oGuard = GetNearestObjectByTag("NW_HOBGOBLIN001");

    SetPlot("Q5_MUSHARAK_WINE", 80, GetPCSpeaker());
    AssignCommand(oGuard, ActionMoveToObject(oWP, TRUE, 0.0));
    AssignCommand(oGuard, ActionDoCommand(DestroyObject(oGuard)));
    DelayCommand(1.0, SetCommandable(FALSE, oGuard));

    ClearAllActions();
    DelayCommand(1.0, ActionMoveToObject(oWP, TRUE, 0.0));
    DelayCommand(3.0, ActionDoCommand(DestroyObject(OBJECT_SELF)));
    DelayCommand(4.0, SetCommandable(FALSE, OBJECT_SELF));
}
