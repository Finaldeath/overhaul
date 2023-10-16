// This will have to be changed so that the local is set only after
// a certain amount of time or another condition is met.  Exactly what
// this timer/condition will be will have to be decided at some point.

void main()
{
    AddJournalQuestEntry("c2_Aribeth", 10, GetPCSpeaker(), FALSE);
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",2);
}
