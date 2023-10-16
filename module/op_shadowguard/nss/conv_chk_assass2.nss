#include "inc_rob"

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iAssassination = Rob_GetJournalState(oPC, "JT_PREL_MARK");
    if (iAssassination >= 1)
    {
        return TRUE;
    }
    return FALSE;
}
