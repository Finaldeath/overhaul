// this will have to be changed later to add a condition or timer before
// the global is set to 4.  It should be set to 4 when Aribeth is ready to
// continue her story.

void main()
{
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",4);
    AddJournalQuestEntry("c2_Aribeth", 20, GetPCSpeaker(), FALSE);
}
