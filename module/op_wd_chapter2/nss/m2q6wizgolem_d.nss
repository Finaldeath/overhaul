//::///////////////////////////////////////////////
//:: User Defined
//:: m2q6WizGolem_D
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The golem attacks when activated by the wizard.
*/
//:://////////////////////////////////////////////
//:: Created By: John Winski
//:: Created On: November 14, 2001
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"

void main()
{
    int nEvent = GetUserDefinedEventNumber();

    switch (nEvent)
    {
        case 600:
            ClearAllActions();
            DetermineCombatRound();
        break;
        case 601:
            // Break down the cell doors.
            SpeakString("Break Doors!");
            ActionMoveToObject(GetWaypointByTag("WP_GOLEM01"));
            ActionMoveToObject(GetWaypointByTag("WP_GOLEM02"));
            ActionMoveToObject(GetWaypointByTag("WP_GOLEM03"));
            ActionMoveToObject(GetWaypointByTag("WP_GOLEM04"));
            ActionMoveToObject(GetObjectByTag("M2Q06DPORTC01"),TRUE);
            ActionOpenDoor(GetObjectByTag("M2Q06DPORTC01"));
            ActionMoveToObject(GetObjectByTag("M2Q06DPORTC02"),TRUE);
            ActionOpenDoor(GetObjectByTag("M2Q06DPORTC02"));
        break;
        case 602:
            // Patrol the main floor.
        break;
        case 603:
            // Kill the Overwizard of the West.
        break;
        case 604:
            // Kill the Overwizard of the South.
        break;
    }
}
