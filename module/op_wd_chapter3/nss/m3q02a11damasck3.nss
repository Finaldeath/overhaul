int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TALKLEVEL")== 2;
    return iResult;
}
