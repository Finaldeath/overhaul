// Deekin has not been freed by Tymofarrar

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5_Deekin_Free") != 1;
    return iResult;
}
