// Trip's story on second level

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "x2_hen_tripstory") == 1;
    return iResult;
}
