//Journal Check: Lyen Quest >= 20
#include "inc_rob"

int StartingConditional()
{
    int iResult = FALSE;
    object oPC = GetPCSpeaker();
    int iJournalState = Rob_GetJournalState(oPC, "JT_PREL_LYEN");
    if (iJournalState >= 20)
    {
        iResult = TRUE;
    }
    return iResult;
}
