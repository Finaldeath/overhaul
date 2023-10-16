// Tomi back at the inn, has been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Tomi_Lives") == 2;
    return iResult;
}
