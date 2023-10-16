// if Jasmeena has set up a deal

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status") == 5;
    return iResult;
}
