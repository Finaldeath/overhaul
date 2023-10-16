#include "help_conv"

void main()
{
    SetNPCInt(OBJECT_SELF, "N_STG_" + IntToString(GetLocalInt(GetModule(), "N_MODULE_STAGE")) + "_INTRO", 1);
}
