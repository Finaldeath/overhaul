int StartingConditional()

/////// Checks if Jury Verdict is unanimous

{
    int l_iResult;

    l_iResult =GetLocalInt(GetModule(),"NW_G_M3Q01PLOTTRIALSTATUS") > 0 && GetLocalInt(GetModule(),"NW_G_M3Q01PLOTVERDICT") ==5;
    return l_iResult;
}
