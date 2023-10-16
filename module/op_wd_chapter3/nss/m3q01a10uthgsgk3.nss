int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") > 0 && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") <3 && GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 0;
    return l_iResult;
}

