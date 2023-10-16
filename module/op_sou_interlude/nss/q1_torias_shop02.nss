// if the PC does not know about Torias's store

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q1_Know_Torias_Store") == 0;
    return iResult;
}
