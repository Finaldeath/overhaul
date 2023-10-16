int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Book2")) &&
                     GetLocalInt(GetModule(),"NW_G_M1S1BookReturned") == FALSE;
    return bCondition;
}
