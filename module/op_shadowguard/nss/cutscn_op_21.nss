#include "help_general"

void main()
{
    object oWP = GetNearestObjectByTag("WP_CT_COMM_CF_FOLL");

    object oCF;

    int NUMB_CRIM_FOLLOWERS = 5;

    int i = 1;

    while (i <= NUMB_CRIM_FOLLOWERS)
    {
        oCF = GetNearestObjectByTag("CT_COMM_CF_FOLL", OBJECT_SELF, i);

        AssignCommand(oCF, DelayCommand(i * 1.0, ActionMoveToObject(oWP, TRUE)));

        DestroyObject(oCF, (i * 1.0) + 5.0);

        i++;
    }
}
