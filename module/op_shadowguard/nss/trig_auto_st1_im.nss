#include "help_hench"
#include "help_general"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetFirstTimeIn())
        {
            //DoSinglePlayerAutoSave();
        }
        else if (GetLocalInt(OBJECT_SELF, "N_DID_ST_6_AUTO") == 0)
        {
            if (GetJournalQuestState("JT_ST_1_MAIN", oPC) >= 6)
            {
                //DoSinglePlayerAutoSave();

                SetLocalInt(OBJECT_SELF, "N_DID_ST_6_AUTO", 1);
            }
        }
    }
}
