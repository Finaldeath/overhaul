// if Jasmeena has offered Musharak a deal

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status") == 3;
    return iResult;
}
