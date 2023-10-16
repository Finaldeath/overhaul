// if the player has not spoken to Jasmeena before

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Jasmeena_Speak") == 0;
    return iResult;
}
