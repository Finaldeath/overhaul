// the player got Torias the wine

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5a_Torias_Wine") == 3;
    return iResult;
}
