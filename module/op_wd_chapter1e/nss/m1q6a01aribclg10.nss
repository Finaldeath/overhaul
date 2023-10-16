// a player has spoke to Nasher only
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01DesthetPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
