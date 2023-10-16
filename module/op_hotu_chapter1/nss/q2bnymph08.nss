// the player promised not to take her heart

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2b_Know_Fairy_Heart") == 2;
    return iResult;
}
