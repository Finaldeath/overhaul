int StartingConditional()
{
    int bCondition =  GetLocalInt(GetModule(),"NW_Resc_Plot") == 100;
    return bCondition;
}

