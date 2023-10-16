// the player has not already been told about the heart

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2b_Know_Fairy_Heart") == 0;
    return iResult;
}
