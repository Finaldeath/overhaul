int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"KNOWS_BARAM_DEAD") == 1;
    return iResult;
}
