// Tomi back at the inn, has not been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Tomi_Lives") == 1;
    return iResult;
}
