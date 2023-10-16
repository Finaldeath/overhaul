// if the player has not asked about Ferran

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1foot_Ferran_Ask") == 0;
    return iResult;
}
