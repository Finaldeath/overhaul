//Give the player the initial journal entries for
//Maker and Mirror plots
//Set Variable marking these have been given
//Drew Karpyshyn, Sept. 17, 2003

void main()
{
 AddJournalQuestEntry("q2_maker",1,GetPCSpeaker());
 AddJournalQuestEntry("q2_mirror",1,GetPCSpeaker());

 SetLocalInt(GetModule(),"Valen_Journal",1);
}

