int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_WanevPlot") == 0 &&
              GetLocalInt(OBJECT_SELF,"NW_L_TalkedToWanev") < 20;
    return iResult;
}
