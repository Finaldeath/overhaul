#include "help_hench"

int StartingConditional()
{
    SetJournalQuest(OBJECT_SELF, "JT_ST_" + IntToString(GetLocalInt(GetModule(), "N_MODULE_STAGE")) + "_MAIN");

    return FALSE;
}
