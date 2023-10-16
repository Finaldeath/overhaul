int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_Resc_Plot") < 100 &&
              GetLocalInt(GetPCSpeaker(),"NW_Resc_PlotExplained") == 1;
    return iResult;
}
