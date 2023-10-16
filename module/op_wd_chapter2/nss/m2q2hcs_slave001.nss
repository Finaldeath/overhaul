int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_SlavesFree") == 10;
    return iResult;
}
