int StartingConditional()

/////// Checks if Jury Verdict 4-1 or 5-0
{
    int l_iResult;

    l_iResult =GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") > 0 && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") >=4;
    return l_iResult;
}
