#include "NW_I0_PLOT"

void main()
{
    object oWaypoint = GetWaypointByTag("WP_M2Q1AribethReturn");

    if (GetDistanceToObject(oWaypoint) > 3.0)
    {
        ActionForceMoveToObject(oWaypoint);
    }
    PlayOldTheme();
}
