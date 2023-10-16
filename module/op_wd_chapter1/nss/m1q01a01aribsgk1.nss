/// Check if prison district is done

int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_M1Q2MainPlot") < 100;
}
