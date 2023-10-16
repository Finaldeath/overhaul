//Marks player as being told about Sabal by the fool
//Drew Karpyshyn, Sept. 08, 2003

void main()
{
    SetLocalInt(OBJECT_SELF,"Sabal",1);
    AddJournalQuestEntry("q6_mainquest",40,GetPCSpeaker());
}
