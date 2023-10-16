// the sword has explained the catch

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "IW_CATCH") == 1;
    return iResult;
}
