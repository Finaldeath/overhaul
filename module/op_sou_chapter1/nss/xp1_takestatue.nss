// Drogan walks up to the PC and takes the Tower Statue
// but the player keeps any others he has

void main()
{
    object oStatue = GetItemPossessedBy(GetPCSpeaker(), "x1tower");
    int nMask = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_mask");
    int nTooth = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_tooth");
    int nHand = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_hand");

    SetLocalInt(OBJECT_SELF, "q1_Drogan_Final_Speech", 1);

    object oPC = GetPCSpeaker();


    // take away any items that the PC has
    if (nTooth == 20)
    {
        AddJournalQuestEntry("q1_artifact_tooth", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }
    if (nHand == 20)
    {
        AddJournalQuestEntry("q1_artifact_hand", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }
    if (nMask == 20)
    {
        AddJournalQuestEntry("q1_artifact_mask", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }

    DestroyObject(oStatue);
    //RemoveJournalQuestEntry("q1_artifact_statue", oPC, TRUE);

}
