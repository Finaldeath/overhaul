// if the healer has already been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(OBJECT_SELF, "q5b_Talked_Healer") == 2;
    return iResult;
}
