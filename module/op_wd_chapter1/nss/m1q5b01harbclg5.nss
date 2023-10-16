int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q1MainPlot") < 25 &&
                     GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") >= 100;
    return bCondition;
}
