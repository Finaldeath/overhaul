///Player has accepted Zesyyr plot

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "Zesyyr_Plot")==TRUE;
    return iResult;
}
