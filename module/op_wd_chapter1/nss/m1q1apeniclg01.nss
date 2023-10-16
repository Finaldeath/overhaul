int StartingConditional()
{
    int bCondition = GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot") == 100 &&
                     !GetIsObjectValid(GetPCSpeaker());
    return bCondition;
}
