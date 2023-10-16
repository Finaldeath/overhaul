// if selected once Elaith is outta there

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF,"I_Am_Leaving") == 1;
    return iResult;
}
