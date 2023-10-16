// * Morag is dead, says a line
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_AMDEAD") == 10;
    return iResult;
}
