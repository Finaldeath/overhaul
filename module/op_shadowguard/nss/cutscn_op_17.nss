#include "help_general"

void main()
{
    object oMark = GetNearestObjectByTag("CS_OP_HENCH_MARK");

    object oLyen = GetNearestObjectByTag("CS_OP_HENCH_LYEN");

    AssignCommand(oMark, ActionMoveToObject(oLyen, FALSE, 2.5));
}
