int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q3PlotReagent")) &&
           GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BLACKLAKEDISTRICT") == FALSE;
}
