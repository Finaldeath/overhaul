// set the current PC as the romance object.  We may want to add in Aribeth giving the
// player some kind of plot item...this can be added in at this point.

void main()
{
    SetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter",6);
    SetLocalObject(OBJECT_SELF,"Chapter2_Aribeth_Romance",GetPCSpeaker());
    AddJournalQuestEntry("c2_Aribeth", 30, GetPCSpeaker(), FALSE);
}
