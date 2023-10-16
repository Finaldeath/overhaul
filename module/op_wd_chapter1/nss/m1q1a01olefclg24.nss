int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1S1BookReturned") == FALSE ||
                     GetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned") == FALSE ||
                     GetLocalInt(GetModule(),"NW_G_M1S1SymbolReturned") == FALSE;
    return bCondition;
}
