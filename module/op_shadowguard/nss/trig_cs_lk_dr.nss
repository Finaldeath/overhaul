#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        object oDoor = GetNearestObject(OBJECT_TYPE_DOOR);

        AssignCommand(oDoor, ActionCloseDoor(oDoor));

        SetLocked(oDoor, TRUE);
    }
}
