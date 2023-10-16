int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S2Portrait")) &&
                     GetLocalInt(OBJECT_SELF,"NW_L_PortraitReturned") == FALSE;
    return bCondition;
}
