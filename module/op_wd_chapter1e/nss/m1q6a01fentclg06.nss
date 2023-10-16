// returns true if a player has spoken to Nasher only
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01DesthetPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
