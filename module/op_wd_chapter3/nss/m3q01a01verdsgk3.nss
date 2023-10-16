int StartingConditional()

/////// Checks if Jury Verdict is 3-2
{
    int l_iResult;

    l_iResult = GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") > 0 && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") ==3;
    return l_iResult;
}
