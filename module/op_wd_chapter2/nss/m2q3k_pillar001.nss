int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_SpawnPortal") == 0;
    return iResult;
}
