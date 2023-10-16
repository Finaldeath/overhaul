int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q4PlotReagent")) &&
           GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_DOCKSDISTRICT") == FALSE;
}
