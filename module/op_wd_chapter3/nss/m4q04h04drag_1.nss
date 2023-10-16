// * Dragon not awake
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_AWAKE") == 0;
    return iResult;
}
