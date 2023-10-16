int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"KNOWS_KURTH_DEAD") == 1;
    return iResult;
}
