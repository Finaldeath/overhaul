int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Ring_Free") == 1;
    return iResult;
}
