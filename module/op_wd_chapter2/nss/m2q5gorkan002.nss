int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_GorkanAttack") == 1;
    return iResult;
}
