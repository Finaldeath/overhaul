int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q5MainPlot") >= 100 &&
                     GetLocalInt(GetPCSpeaker(),"NW_L_M1Q5SpokeToHarben") == FALSE;
    return bCondition;
}

