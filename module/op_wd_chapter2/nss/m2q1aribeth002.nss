void main()
{
    int iGiven = GetLocalInt(OBJECT_SELF,"Journals_Given");
    object oInfo = GetLocalObject(OBJECT_SELF,"NW_L_TakeJournal");

    SetLocalInt(OBJECT_SELF,"Journals_Given",(iGiven + 1));
    DestroyObject(oInfo);
    oInfo = OBJECT_INVALID;
}
