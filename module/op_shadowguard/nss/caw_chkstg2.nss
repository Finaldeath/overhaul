#include "help_hench"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iResult = FALSE;

    if (GetJournalQuestState("JT_ST_1_MAIN", oPC) < 1)
    {
        iResult = TRUE;
    }

    return iResult;
}
