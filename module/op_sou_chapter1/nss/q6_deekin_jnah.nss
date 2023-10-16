// if the player has already been told about J'Nah

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "Know_Jnah") == 1;
    return iResult;
}
