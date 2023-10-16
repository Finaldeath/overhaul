// this creates Aarin's amulet on the player and sets the chapter 2 part of
// the romance to complete

void main()
{
    AddJournalQuestEntry("c2_Aarin", 40, GetPCSpeaker(), FALSE);
    SetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter",7);
    CreateItemOnObject("AARIN_AMULET",GetPCSpeaker());
}
