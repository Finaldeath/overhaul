// this global will have to have a timer attached to it eventually

void main()
{
    AddJournalQuestEntry("c2_Aarin", 20, GetPCSpeaker(), FALSE);
    SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",4);
}
