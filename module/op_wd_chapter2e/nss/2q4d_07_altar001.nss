int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_SealBroken") == 1;
    return iResult;
}
