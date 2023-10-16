// the sword has not explained the catch

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "IW_CATCH") == 0;
    return iResult;
}
