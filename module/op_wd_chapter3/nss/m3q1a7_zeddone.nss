int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0
    && GetLocalInt(GetModule(),"NW_G_M1Q00PLOTSPIKED") == 99;
    return l_iResult;
}
