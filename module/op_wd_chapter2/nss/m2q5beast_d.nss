#include "NW_I0_GENERIC"

void main()
{
    int nEvent = GetUserDefinedEventNumber();
    object oWaypoint1 = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_1");
    object oWaypoint2 = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_2");
    object oWaypoint3 = GetWaypointByTag("WP_" + GetTag(OBJECT_SELF) + "_3");

    switch (nEvent)
    {
        case 500:
            ActionMoveToObject(oWaypoint1,TRUE);
            ActionMoveToObject(oWaypoint2,TRUE);
            ActionMoveToObject(oWaypoint3,TRUE);
            ActionDoCommand(DetermineCombatRound());
        break;
    }
}
