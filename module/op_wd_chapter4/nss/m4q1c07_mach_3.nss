//* first combination
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M41C07_LEVER_PUZZLE") == 30;
    return iResult;
}

