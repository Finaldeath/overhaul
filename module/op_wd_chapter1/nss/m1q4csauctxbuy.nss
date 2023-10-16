int StartingConditional()
{
    int nCost = 15;
    int nCount;
    object oCoin = GetFirstItemInInventory(GetPCSpeaker());
    while( GetIsObjectValid(oCoin) )
     {
        if(GetTag(oCoin) == "M1Q04ISMUGCOIN")
        {
            nCount = nCount + GetNumStackedItems(oCoin) ;
        }
        oCoin = GetNextItemInInventory(GetPCSpeaker());
    }
    int bCondition = GetLocalInt(OBJECT_SELF,"NW_L_ItemXSold") == FALSE &&
                     nCount >= nCost;
    return bCondition;
}
