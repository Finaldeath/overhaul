// the kobold prisoners have not been found yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "NW_JOURNAL_ENTRYQ3_JOURNAL_KOBOLD_PRISONERS") == 0;
    return iResult;
}
