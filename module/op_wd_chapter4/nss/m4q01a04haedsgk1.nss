/// Checks if plot status is at 1 (final word has been brought to Haedraline)

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M4Q01PLOTSOURCE_STONE")==1;
    return iResult;
}
