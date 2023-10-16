// if Bethsheva now has a mate

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "q1b_Bethsheva_Secret") == 2;
    return iResult;
}
