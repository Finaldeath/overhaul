int StartingConditional()
{
    int iPlot = GetLocalInt(GetModule(),"NW_CONS_PLOT");
    object oSpeak = GetLocalObject(OBJECT_SELF,"NW_CONS_PLOT_PC");
    if ((iPlot == 1) && (oSpeak == GetPCSpeaker()))
    {
        return TRUE;
    }
    return FALSE;
}
