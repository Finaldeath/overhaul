// Set the fool's status to 1: talked to without the shards
//Set Module Global to mark player is on mirror quest
void main()
{
    SetLocalInt(OBJECT_SELF, "STATUS", 1);
    SetLocalInt(GetModule(),"Mirror",10);
    AddJournalQuestEntry("q6_mainquest",30,GetPCSpeaker());
}
