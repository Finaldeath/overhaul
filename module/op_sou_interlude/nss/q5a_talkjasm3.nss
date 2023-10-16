// if the player has talked to Jasmeena previously

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status") > 1;
    return iResult;
}
