// if the ruins have been mentioned

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Jnah_Ruins") == 1;
    return iResult;
}
