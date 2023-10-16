// Trip's story not begun yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "x2_hen_tripstory") == 0;
    return iResult;
}
