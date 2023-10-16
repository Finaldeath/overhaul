// this global should be set once the druids of Neverwinter Wood have been helped

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetModule(),"Chapter2_Aawill_Plot_Done");
    int iPlot2 = GetLocalInt(OBJECT_SELF,"Aawil_Plot_Mentioned");
    if ((iPlot1 == 1) && (iPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
