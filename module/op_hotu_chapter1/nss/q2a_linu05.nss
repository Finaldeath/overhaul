// Linu back at the inn, has not been talked to

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q2a_Linu_Lives") == 1;
    return iResult;
}

