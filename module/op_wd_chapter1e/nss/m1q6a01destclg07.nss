//returns true is a player has spoken to Aribeth only
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual")  == FALSE &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01NasherPreRitual") == FALSE;
    return bCondition;
}
