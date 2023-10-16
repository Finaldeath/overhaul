//returns true is a player has spoken to Aribet and Nasher
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual");
    return bCondition;
}
