// this creates Aribeth's ring on the PC...which is what is detected in later
// chapters to determine that the Aribeth romance is active.

void main()
{
    CreateItemOnObject("ARIBETH_RING",GetPCSpeaker());
    AddJournalQuestEntry("c2_Aribeth", 40, GetPCSpeaker(), FALSE);
}
