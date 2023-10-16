#include "help_hench"

//::///////////////////////////////////////////////
//:: FileName conv_sc_mrpo_03
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 5/14/2003 7:40:19 PM
//:://////////////////////////////////////////////
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_TALK_SWITCH") == 0)
        return FALSE;

    string s = GetJournalQuest(GetTag(OBJECT_SELF));

    if (GetPCInt(GetPCSpeaker(), s) < 2)
        return FALSE;

    // Inspect local variables
    if(!(GetLocalInt(GetPCSpeaker(), "N_GOT_IRIL_CRYS") == 0))
        return FALSE;

    return TRUE;
}
