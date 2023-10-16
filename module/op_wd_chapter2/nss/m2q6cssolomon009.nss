int StartingConditional()
{
    int iResult;

    iResult = !GetIsObjectValid(GetPCSpeaker()) &&
               GetLocalInt(GetModule(),"NW_G_M2Q6MainPlot") == 2;
    return iResult;
}
