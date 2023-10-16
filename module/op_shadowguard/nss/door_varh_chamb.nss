#include "help_general"
#include "help_hench"

void main()
{
    object oPC = GetFirstPC();

    if (GetPlotFlag(OBJECT_SELF) == FALSE && GetJournalQuestState("JT_PREL_KARA", oPC) < 8)
    {
        object oAnag = GetNearestObjectByTag("CT_UNIQ_SH_ANAG");
        SceneSpeak(oAnag, GetName(oPC) + ", just what do you think you are doing?!");
        AssignCommand(oAnag, ActionStartConversation(oPC));
//        AddJournalSingle("JT_PREL_KARA", 5, oPC);
    }
}
