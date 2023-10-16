int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_DaggerReturned") == 2;
    return iResult;
}
