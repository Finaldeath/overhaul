int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_TalkedToPC") == 10;
    return iResult;
}
