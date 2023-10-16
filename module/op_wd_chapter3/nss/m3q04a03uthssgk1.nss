int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED") < 3;
    return iResult;
}
