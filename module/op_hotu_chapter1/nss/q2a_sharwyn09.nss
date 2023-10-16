// Sharwyn back at the inn, hates the PC, has been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Sharwyn_Lives") == 4;
    return iResult;
}
