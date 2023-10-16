// a player has spoke to Fenthick, Desther and Nasher
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual")&&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01DesthetPreRitual")&&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
