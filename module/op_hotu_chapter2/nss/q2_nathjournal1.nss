//Give the player the initial journal entries for
//Beholder, illithid and undead plots
//Set Variable marking these have been given
//Drew Karpyshyn, Sept. 17, 2003

void main()
{
 AddJournalQuestEntry("q2_beholder",1,GetPCSpeaker());
 AddJournalQuestEntry("q2_undead",1,GetPCSpeaker());
 AddJournalQuestEntry("q2_illithid",1,GetPCSpeaker());

 SetLocalInt(GetModule(),"Nathyrra_Journal",1);
}
