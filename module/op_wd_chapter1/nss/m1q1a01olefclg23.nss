int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1S1BookReturned") == TRUE &&
                     GetLocalInt(GetModule(),"NW_G_M1S1ArmorReturned") == TRUE &&
                     GetLocalInt(GetModule(),"NW_G_M1S1SymbolReturned") == TRUE &&
                     GetLocalInt(GetModule(),"NW_G_M1S1Plot") < 100;
    return bCondition;
}
