//returns true is a player has spoken to no one else
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual")  == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual") == FALSE;
    return bCondition;
}
