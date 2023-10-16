#include "help_general"

void main()
{
    object oPC = GetPCSpeaker();

    object oRakha = GetNearestObjectByTag("CT_UNIQ_NT_RAKH_1", oPC);

    object oOldWoman = GetNearestObjectByTag("NW_OLDWOMAN_2", oPC);

    AssignCommand(oRakha, ActionMoveToObject(oOldWoman, FALSE, 1.5));
}
