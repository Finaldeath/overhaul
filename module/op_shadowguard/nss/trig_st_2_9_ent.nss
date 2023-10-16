#include "help_hench"
#include "help_general"

void main()
{
    // NO LONGER DOES ANYTHING AT THE MOMENT
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_2_MAIN", oPC) >= 7)
            if (GetLocalInt(oPC, "N_ST_2_COMP_SG_QUESTS") >= GetLocalInt(GetModule(), "N_ST_2_QUESTS_IMPLEMENTED"))
                AddJournalSingle("JT_ST_2_MAIN", 9, oPC);
    }
}
