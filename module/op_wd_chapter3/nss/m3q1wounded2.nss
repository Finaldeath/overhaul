//* Vomits blood
int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"NW_L_VOMIT") == 1;
    return iResult;
}
