#include "help_general"

void main()
{
    object oOldMan = GetNearestObjectByTag("NW_OLDMAN_1");

    object oGuard;

    int NUMB_OF_KHAG_GUARDS = 3;

    int i = 1;

    while (i <= NUMB_OF_KHAG_GUARDS)
    {
        oGuard = GetNearestObjectByTag("CT_COMM_EVIL_SOLD", OBJECT_SELF, i);

        AssignCommand(oGuard, ActionMoveToObject(oOldMan));

        i++;
    }

}
