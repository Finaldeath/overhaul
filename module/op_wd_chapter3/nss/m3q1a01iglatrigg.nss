int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_I_WAS_TRIGGERED_TO_TALK") == 10;
    return iResult;
}
