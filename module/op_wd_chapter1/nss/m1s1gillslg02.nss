#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    if (GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_gilles") > 0)
    {
        AddJournalQuestEntry("m1q1_gilles", 70, oPC);
    }
    ActionPauseConversation();
    ActionGiveItem(GetItemPossessedBy(OBJECT_SELF,"M1S1Quill"),GetPCSpeaker());
    ActionResumeConversation();
    ActionMoveToObject(GetNearestObjectByTag("WP_M1S2B_M1S2C"),TRUE);
    ActionDoCommand(DestroyObject(OBJECT_SELF));
}
