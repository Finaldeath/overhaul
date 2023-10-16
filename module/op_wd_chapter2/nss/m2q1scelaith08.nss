int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"Advance_Paid") == 1;
    return iResult;
}
