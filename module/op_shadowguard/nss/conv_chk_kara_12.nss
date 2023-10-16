#include "help_hench"
#include "inc_rob"

// A custom script for Kara to handle the splitting of the "JT_PREL_KARA" into
// two separate quests.

int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    object oPC = GetPCSpeaker();
    object oMalgor = GetObjectByTag("CT_UNIQ_UN_MALG");
    int bJourn_Kara2 = Rob_GetJournalState(oPC, "JT_PREL_KARA_2");
    if (oMalgor == OBJECT_INVALID &&
        bJourn_Kara2 < 13)
    {
        return TRUE;
    }
    return FALSE;
}
