#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetFirstPC();

    if (GetIsPC(oPC) == TRUE)
    {
        if (GetJournalQuestState("JT_ST_1_MAIN", oPC) >= 6)
        {
            ExecuteScript("strt_final", oPC);
        }
    }
}
