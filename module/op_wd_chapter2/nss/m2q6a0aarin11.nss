// this global should be set upon the player successfully entering Luskan

int StartingConditional()
{
    int iPlot1 = GetLocalInt(GetModule(),"Chapter2_Luskan_Entered");
    int iPlot2 = GetLocalInt(OBJECT_SELF,"Entering_Luskan_Mentioned");
    if ((iPlot1 == 1) && (iPlot2 == 0))
    {
        return TRUE;
    }
    return FALSE;
}
