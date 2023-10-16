int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TalkedToWanev") == 0;
    return iResult;
}
