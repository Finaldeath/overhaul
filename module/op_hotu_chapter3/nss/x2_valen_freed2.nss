// if Valen's taint has been removed

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "bValensTaintGone") == TRUE;
    return iResult;
}
