// if the minister has already given the mission about the missing men

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q5a_Know_Missing") == 2;
    return iResult;
}
