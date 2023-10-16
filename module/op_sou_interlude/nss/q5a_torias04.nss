// the player agreed to get the wine

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5a_Torias_Wine") == 2;
    return iResult;
}
