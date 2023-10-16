int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"NW_ARTI_PLOT");
    object oSpeak = GetLocalObject(OBJECT_SELF,"NW_ARTI_PLOT_PC");
    if ((iPlot == 1) && (oSpeak != GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
