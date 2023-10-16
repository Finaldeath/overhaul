int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_AllowPlanting") == 0;
    return iResult;
}
