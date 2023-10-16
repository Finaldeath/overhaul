int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_FoundImaskTome") == 0;
    return iResult;
}
