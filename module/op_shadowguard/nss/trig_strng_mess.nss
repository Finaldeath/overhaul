#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC))
    {
        if (GetJournalQuestState("JT_ST_0_MAIN", oPC) == 5)
        {
            if (GetFirstTimeIn())
            {
                location l = GetLocation(oPC);

                CreateObject(OBJECT_TYPE_CREATURE, "CT_UNIQ_NT_STMS", l);
            }

            object oMess = GetNearestObjectByTag("CT_UNIQ_NT_STMS", oPC);

            if (GetArea(oMess) == GetArea(oPC))
            {
                SceneSpeak(oMess, "Excuse me, " + GetName(oPC) + ", but might I speak with you for a moment?");

                AssignCommand(oMess, ActionStartConversation(oPC));
            }
        }
    }
}
