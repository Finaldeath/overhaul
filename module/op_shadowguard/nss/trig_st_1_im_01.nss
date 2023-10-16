#include "help_general"
#include "help_hench"
void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_1_MAIN", oPC) >= 6)
        {
            if (GetFirstTimeIn())
            {
                object oMarkius = GetNearestObjectByTag("HENCH_MARK");

                SceneSpeak(oMarkius, GetName(oPC) + ", we should speak with one another before you head into the Market District.  Please, come here for a moment.");

                AddJournalSingle("JT_ST_1_MAIN", 7, oPC);
            }
        }
    }
}
