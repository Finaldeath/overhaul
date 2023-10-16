//* Player has at least 2 reagents
int GetNumItems(object oTarget)
{
    int nHasReagents = FALSE;
    int nNumItems = 0;
    object oItem = GetFirstItemInInventory(oTarget);

    while (GetIsObjectValid(oItem) == TRUE && nNumItems < 2)
    {
        if (GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFIRBEETBEL"))
        || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITFENBERRY"))
        || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITETTERSILK"))
        || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITSKELKNUCKL"))
        || GetIsObjectValid(GetItemPossessedBy(GetLastSpeaker(),"M2Q1ITQUARTZCRYS")))
        {
            nNumItems++;
        }
        oItem = GetNextItemInInventory(oTarget);
    }
    if (nNumItems > 1)
        nHasReagents = TRUE;
   return nHasReagents;
}

int StartingConditional()
{
	int l_iResult;

	l_iResult = GetNumItems(GetLastSpeaker());

	return l_iResult;
}
