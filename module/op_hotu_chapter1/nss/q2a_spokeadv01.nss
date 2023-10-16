// the PC spoke to the adventurers in the inn

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "PRE_SPOKE_ADVENTURERS") == 1;
    return iResult;
}
