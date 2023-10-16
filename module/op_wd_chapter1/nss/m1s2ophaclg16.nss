int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Urn")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_UrnReturned") == FALSE;
    return bCondition;
}
