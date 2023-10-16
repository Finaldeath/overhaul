//* Vomits blood, random line
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_VOMIT") == 1 && Random(100) > 50;
    return iResult;
}

