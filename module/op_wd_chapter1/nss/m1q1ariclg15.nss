int StartingConditional()
{
    return GetIsObjectValid(GetItemPossessedBy(GetPCSpeaker(),"M1Q5PlotReagent")) &&
           GetLocalInt(GetModule(),"NW_G_M1Q01PLOT_BEGGARSNEST") == FALSE;
}

