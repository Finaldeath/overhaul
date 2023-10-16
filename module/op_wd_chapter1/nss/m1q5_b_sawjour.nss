int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5MarcNote")))
    {
        if (GetLocalInt(OBJECT_SELF,"LShownMarcusJournal") == 1)
        {
            if (GetLocalInt(OBJECT_SELF,"LJournalGiven") < 1 ||
                GetLocalInt(OBJECT_SELF,"LJournalSold") < 1)
            {
                return TRUE;
            }
            return FALSE;
        }
        return FALSE;
    }
    return FALSE;
}

