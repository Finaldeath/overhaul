#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oGuard;

            object oWP;

            location lWP;

            string sSpeak = "Make for the Docks!  Officer Ganolin still holds the gates!  Flee the city 'ere it is too late!";

            oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1", oPC, 1);

            oWP = GetNearestObjectByTag("WP_CT_COMM_SH_STG1_M1", oPC);

            lWP = GetLocation(oWP);

            SceneSpeak(oGuard, sSpeak);

            AssignCommand(oGuard, ActionMoveToLocation(lWP, TRUE));

            oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1", oPC, 2);

            oWP = GetNearestObjectByTag("WP_CT_COMM_SH_STG1_M2", oPC);

            lWP = GetLocation(oWP);

            SceneSpeak(oGuard, sSpeak);

            AssignCommand(oGuard, ActionMoveToLocation(lWP, TRUE));
        }
    }
}
