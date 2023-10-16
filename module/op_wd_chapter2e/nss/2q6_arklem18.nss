// the PC hasn't been told about the Words of Power

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"WORDS_OF_POWER_KNOWN") == 0;
    return iResult;
}
