// if the true name was used to give Deekin confidence

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "bDeekinBelieves") == TRUE;
    return iResult;
}
