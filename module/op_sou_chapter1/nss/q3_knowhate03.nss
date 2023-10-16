// if the PC has already heard that the gnolls hate J'Nah and want her dead
// and the gnolls have not already agreed to help fight her

int StartingConditional()
{
    int nPlot = GetLocalInt(GetPCSpeaker(), "q3_Know_Gnolls_Hate");
    // need to have global here for checking if the gnolls have agreed to fight her

    if (nPlot == 1) // need to add check for global above
    {
        return TRUE;
    }
    return FALSE;
}
