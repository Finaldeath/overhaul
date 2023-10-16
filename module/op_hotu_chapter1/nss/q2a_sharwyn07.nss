// Sharwyn back at the inn, has been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Sharwyn_Lives") == 3;
    return iResult;
}
