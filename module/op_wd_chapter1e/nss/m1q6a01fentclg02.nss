// returns true if a player has spoken to Aribeth, Desther and Nasher
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01DesthetPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
