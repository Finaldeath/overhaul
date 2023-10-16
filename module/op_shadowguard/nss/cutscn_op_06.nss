#include "help_general"

void main()
{
    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_1");

    object oWP = GetNearestObjectByTag("WP_CS_OP_RAKH_WALK_1", oRakha);

    AssignCommand(oRakha, ActionMoveToObject(oWP));

    DestroyObject(oRakha, 3.0);
}
