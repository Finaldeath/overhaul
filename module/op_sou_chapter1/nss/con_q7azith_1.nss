int StartingConditional()
{
    object oItem = GetFirstItemInInventory(GetPCSpeaker());
    string sTag;
    while(oItem != OBJECT_INVALID)
    {
        sTag = GetTag(oItem);
        if(GetStringLeft(sTag, 13) == "NW_IT_MPOTION")
        {
            return TRUE;

        }
        oItem = GetNextItemInInventory(GetPCSpeaker());

    }
    return FALSE;
}
