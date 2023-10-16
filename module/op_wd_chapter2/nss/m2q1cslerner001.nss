int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_GaveMoney") == 0;
    return iResult;
}
