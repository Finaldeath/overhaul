// if the PC knows about Torias's store

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1_Know_Torias_Store") == 1;
    return iResult;
}
