#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();
    object oWPTo = GetNearestObjectByTag("WP_OKAR_ASSA_01", oPC);
    object oCrim;

    oCrim = CreateCreatureOnWP("CT_UNIQ_NT_CRIM", oPC);

    DelayCommand(1.0f, AssignCommand(oCrim,
        ActionMoveToObject(oWPTo, FALSE, 0.0f)));
}
