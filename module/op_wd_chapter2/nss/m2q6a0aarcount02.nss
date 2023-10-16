// advance Aarin meter, add PC-specific journal entry

void main()
{
    AddJournalQuestEntry("c2_Aarin", 10, GetPCSpeaker(), FALSE);
    SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",2);
}
