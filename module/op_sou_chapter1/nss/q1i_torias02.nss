// if Torias has already been spoken to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_talked_Torias") == 1;
    return iResult;
}
