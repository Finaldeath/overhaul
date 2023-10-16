// the player convinced Torias into sobriety

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5a_Torias_Wine") == 4;
    return iResult;
}
