int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q2PlotReagent")) &&
           GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_PRISONDISTRICT") == FALSE;
}
