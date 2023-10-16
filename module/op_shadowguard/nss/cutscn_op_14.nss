#include "help_general"

void main()
{
    object oTari = GetNearestObjectByTag("CS_OP_HENCH_TARI");

    object oBruk = GetNearestObjectByTag("CS_OP_HENCH_BRUK");

    object oKara = GetNearestObjectByTag("CS_OP_HENCH_KARA");

    object oGuard = GetNearestObjectByTag("CT_COMM_SH_STG1_1");

    AssignCommand(oKara, ActionMoveToObject(oGuard));

    AssignCommand(oBruk, ActionMoveToObject(oGuard, FALSE, 2.0));
}
