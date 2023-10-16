// Glendir has told the truth

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Glendir_Lie") == 2;
    return iResult;
}
