int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetArea(OBJECT_SELF),"NW_A_ChildTaken") == 10;
    return iResult;
}
