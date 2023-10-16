//update journal entry for guard
//player knows wife is medusa
//Drew Karpyshyn

void main()
{

 AddJournalQuestEntry("q6_library",10,GetPCSpeaker());
 SetLocalInt(GetModule(), "Q6_PLAYER_KNOWS_MEDUSA", 1);
}
