// Katriana has not yet told the player about the missing cards

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1i_Katriana_Job") == 0;
    return iResult;
}
