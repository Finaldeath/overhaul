#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            object oDoor = GetNearestObjectByTag("DOOR_GHAA_ACAD_TEST_TO_ACAD", oPC);

            AssignCommand(oDoor, ActionCloseDoor(oDoor));

            SetLocked(oDoor, TRUE);
        }
    }
}
