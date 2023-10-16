// Drogan walks up to the PC and takes all the artifacts
// that the PC has

void main()
{
    object oStatue = GetItemPossessedBy(GetPCSpeaker(), "x1tower");
    object oTooth = GetItemPossessedBy(GetPCSpeaker(), "x1dragontooth");
    object oHand = GetItemPossessedBy(GetPCSpeaker(), "mummifiedhand");
    object oMask = GetItemPossessedBy(GetPCSpeaker(), "x1mask");

    int nMask = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_mask");
    int nTooth = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_tooth");
    int nHand = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYq1_artifact_hand");

    SetLocalInt(OBJECT_SELF, "q1_Drogan_Final_Speech", 1);

    object oPC = GetPCSpeaker();


    // take away any items that the PC has
    if (GetIsObjectValid(oTooth))
    {
        DestroyObject(oTooth);
        AddJournalQuestEntry("q1_artifact_tooth", 50, oPC);
    }
    else if (nTooth == 20)
    {
        AddJournalQuestEntry("q1_artifact_tooth", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }

    if (GetIsObjectValid(oHand))
    {
        DestroyObject(oHand);
        AddJournalQuestEntry("q1_artifact_hand", 50, oPC);
    }
    else if (nHand == 20)
    {
        AddJournalQuestEntry("q1_artifact_hand", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }

    if (GetIsObjectValid(oMask))
    {
        DestroyObject(oMask);
        AddJournalQuestEntry("q1_artifact_mask", 50, oPC);
    }
    else if (nMask == 20)
    {
        AddJournalQuestEntry("q1_artifact_mask", 45, oPC, TRUE, FALSE, TRUE);
        AdjustAlignment(oPC, ALIGNMENT_CHAOTIC, 3);
    }

    DestroyObject(oStatue);
    //RemoveJournalQuestEntry("q1_artifact_statue", oPC, TRUE);

}
