//returns true is a player has spoken to Nasher only
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual")  == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
