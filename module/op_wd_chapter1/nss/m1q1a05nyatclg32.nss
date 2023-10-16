int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") == 1;
    return bCondition;
}
