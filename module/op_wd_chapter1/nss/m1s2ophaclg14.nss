int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Statue")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_StatueReturned") == FALSE;
    return bCondition;
}
