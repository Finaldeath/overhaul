// the PC hasn't already heard that the gnolls hate J'Nah and want her dead.

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Gnolls_Hate") == 0;
    return iResult;
}
