#include "help_general"

void main()
{
    object oKing = GetNearestObjectByTag("CT_UNIQ_NT_DL_0_2");

    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_2");

    object oGuard;

    int i = 1;

    int NUMB_OF_GUARDS = 3;

    while (i <= NUMB_OF_GUARDS)
    {
        oGuard = GetNearestObjectByTag("CT_COMM_EVIL_SOLD_1", OBJECT_SELF, i);

        AssignCommand(oGuard, ActionMoveToObject(oRakha, FALSE, 4.0));

        i++;
    }

    i = 1;

    int NUMB_OF_PEOPLE = 3;

    object oPerson;

    while (i <= NUMB_OF_PEOPLE)
    {
        oPerson = GetNearestObjectByTag("CT_COMM_PERS_1", OBJECT_SELF, i);

        AssignCommand(oPerson, ActionMoveAwayFromObject(oRakha, TRUE, 100.0));

        DestroyObject(oPerson, 4.0);

        i++;
    }

    AssignCommand(oKing, ActionMoveToObject(oRakha, FALSE, 2.0));

    AssignCommand(oRakha, SetFacingPoint(GetPosition(oKing)));

}
