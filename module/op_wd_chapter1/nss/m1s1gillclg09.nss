int StartingConditional()
{
    int bCondition = GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1S1Tyr")) &&
                     GetLocalInt(GetModule(),"NW_G_M1S1SymbolReturned") == FALSE;
    return bCondition;
}
