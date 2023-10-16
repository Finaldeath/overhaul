void main()
{
    object oPlayer = GetPCSpeaker();
    int iNewsState = GetLocalInt(oPlayer, "NW_JOURNAL_ENTRYM1Q5_NEWS");

/*
    if (iNewsState > 20)
    {
          AddJournalQuestEntry("M1Q5_NEWS", 30, oPlayer, TRUE, TRUE);
    }
*/
    if(GetIsObjectValid(oPlayer))
    {
        SetLocalInt(OBJECT_SELF,"L_TALKTIMES",GetLocalInt(OBJECT_SELF,"L_TALKTIMES") + 1);
        SetLocalObject(OBJECT_SELF,"NW_L_FirstSpoken",oPlayer);
        SetCustomToken(42,GetName(oPlayer));
    }
}
