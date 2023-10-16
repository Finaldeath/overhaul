int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_ToldRumor") == 0;
    return iResult;
}
