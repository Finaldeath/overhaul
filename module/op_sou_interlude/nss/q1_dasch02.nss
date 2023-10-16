// if the player knows what services Daschnaya can provide

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1_Know_Daschnaya") == 1;
    return iResult;
}
