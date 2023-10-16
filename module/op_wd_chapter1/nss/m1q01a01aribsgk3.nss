/// Check if BLACKLAKE DISTRICT is done

int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_M1Q3MainPlot") < 100;
}
