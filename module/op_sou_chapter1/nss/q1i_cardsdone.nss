// once the cards have been returned to Daschnaya

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q1i_Daschnaya");
    if (nPlot == 1)
    {
        return TRUE;
    }
    return FALSE;
}
