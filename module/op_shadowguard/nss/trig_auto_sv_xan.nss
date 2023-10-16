#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
        if (GetJournalQuestState("JT_ST_0_MAIN", oPC) == 6)
            if (GetFirstTimeIn())
                DoSinglePlayerAutoSave();
}
