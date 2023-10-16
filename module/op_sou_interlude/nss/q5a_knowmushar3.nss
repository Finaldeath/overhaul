// if Musharak has agreed to share profits with the minister

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if ((nPlot == 4) || (nPlot == 5))
    {
        return TRUE;
    }
    return FALSE;
}
