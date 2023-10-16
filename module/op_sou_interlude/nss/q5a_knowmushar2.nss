// if Musharak has told the PC he wants to trade the Aoist wine
// whether or not the PC has agreed to help him

int StartingConditional()
{
    int nPlot = GetLocalInt(GetModule(), "q5a_Musharak_Wine");
    if ((nPlot > 1) && (nPlot != 8))
    {
        return TRUE;
    }
    return FALSE;
}
