int StartingConditional()
{
    int iResult;

    iResult = GetAlignmentGoodEvil(GetPCSpeaker()) == ALIGNMENT_GOOD;
    return iResult;
}
