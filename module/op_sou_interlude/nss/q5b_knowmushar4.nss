// if Musharak has agreed to convert

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if ((nPlot == 6) || (nPlot == 7))
    {
        return TRUE;
    }
    return FALSE;
}
