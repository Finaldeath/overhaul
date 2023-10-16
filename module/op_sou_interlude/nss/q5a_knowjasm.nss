// if the player has not spoken to Jasmeena before

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Status") < 2;
    return iResult;
}
