#include "NW_I0_Plot"
void main()
{
    SetLocalInt(OBJECT_SELF,"NW_L_M1S2ArtReturned",GetLocalInt(OBJECT_SELF,"NW_L_M1S2ArtReturned") + 1);
    SetLocalInt(OBJECT_SELF,"NW_L_StatueReturned",TRUE);
    DestroyObject(GetItemPossessedBy(GetPCSpeaker(),"M1S2Statue"));

// Check the state of the Art Theft quest. Update journal entry accordingly
    object oPC = GetPCSpeaker();
    int iJournalState = GetLocalInt(oPC, "NW_JOURNAL_ENTRYm1q1_Theft");
    string sJournalTag = "m1q1_Theft";
    switch (iJournalState)
    {
        case 0:
        case 10:
        {
            AddJournalQuestEntry(sJournalTag, 20, oPC);
        }
        break;

        case 20:
        {
            AddJournalQuestEntry(sJournalTag, 30, oPC);
        }
        break;

        case 30:
        {
            AddJournalQuestEntry(sJournalTag, 40, oPC);
        }
        break;
    }
    RewardXP(sJournalTag,50,oPC);
}
