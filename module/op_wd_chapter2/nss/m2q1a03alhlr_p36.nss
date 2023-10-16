int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_PLOTURTH") != 0;
    return iResult;
}
