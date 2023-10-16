int StartingConditional()
{
    int iResult = GetLocalInt(OBJECT_SELF, "HX_CATAPULT_BEEN_FIRED");

    if(iResult == 1)
        iResult = TRUE;
    else
        iResult = FALSE;

    return iResult;
}
