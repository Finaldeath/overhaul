#include "inc_rob"

//Returns TRUE if the player has overheard his father discussing the strange gem.

int StartingConditional()
{
    object oPC = GetPCSpeaker();
    int iJournal = Rob_GetJournalState(oPC, "JT_ST_0_MAIN");
    if (iJournal >= 10)
    {
        return TRUE;
    }
    return FALSE;
}
