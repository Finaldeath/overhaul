#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_0_MAIN", oPC) == 11)
        {
            if (GetFirstTimeIn())
            {
                object oMark = GetNearestObjectByTag("HENCH_MARK", oPC);

                SceneSpeak(oMark, GetName(oPC) + ", might I speak with you for a moment?");

                AssignCommand(oMark, ActionStartConversation(oPC));
            }
        }
    }
}
