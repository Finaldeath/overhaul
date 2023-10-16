// if the ruins have not been mentioned yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Know_Jnah_Ruins") == 0;
    return iResult;
}
