// Deekin has not already been freed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q5_Deekin_Free") == 0;
    return iResult;
}
