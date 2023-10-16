// sets the meter global to 3, to prevent the player from discussing the matter twice

void main()
{
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",3);
    //AddJournalQuestEntry("c2_Aribeth", 50, GetPCSpeaker(), FALSE);
}
