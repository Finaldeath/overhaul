int StartingConditional()
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") == 0 &&
                GetLocalInt(GetPCSpeaker(),"JevonBribe") ==1;
    return l_iResult;
}

