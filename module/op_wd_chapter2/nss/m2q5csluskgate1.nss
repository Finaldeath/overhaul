int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetModule(),"Luskan_Gate_Open");
    int iPlot2 = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_GateOpen");
    if ((iPlot1 == 1) && (iPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
