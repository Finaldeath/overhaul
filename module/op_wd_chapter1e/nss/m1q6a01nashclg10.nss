// A playerr has spoke to Fenthick only
int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q6A01AribethPreRitual") == FALSE&&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01FenthickPreRitual") &&
                     GetLocalInt(GetModule(),"NW_G_M1Q6A01DesthetPreRitual") == FALSE;
    return bCondition;
}
