// If Deekin is not free and the PC
// has agreed to kill J'Nah

int StartingConditional()
{
    int nFree = GetLocalInt(GetModule(), "q5_Deekin_Free");
    int nPlot = GetLocalInt(GetModule(), "X1_TYMOFARRAR_STATUS");

    if ((nFree == 0) && (nPlot == 2))
    {
        return TRUE;
    }
    return FALSE;
}
