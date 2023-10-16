// if the player has not asked before

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1_Know_Daschnaya") == 0;
    return iResult;
}
