// the player refused to get the wine

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5a_Torias_Wine") == 1;
    return iResult;
}
