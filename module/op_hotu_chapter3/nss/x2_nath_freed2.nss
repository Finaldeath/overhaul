// if Nathyrra has forgiven herself via the True Name

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "bNathyrraForgiven") == TRUE;
    return iResult;
}
