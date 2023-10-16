int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKTIMES") == 0;
    return iResult;
}
