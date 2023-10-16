int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_L_C03_TALKTIMES") == 0;
    return iResult;
}

