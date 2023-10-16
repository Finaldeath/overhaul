// after initial conversation

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q2_Torias_Talked_To") == 1;
    return iResult;
}
