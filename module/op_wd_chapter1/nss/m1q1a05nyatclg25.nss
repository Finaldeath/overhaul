int StartingConditional()
{
    int bCondition = (GetLocalInt(GetModule(),"NW_G_M1S5AnimalsRescued") +
                     GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled")) >= 4 &&
                     GetLocalInt(GetModule(),"NW_G_M1S5AnimalsKilled") > 0 ;
    return bCondition;
}
