int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_PLOTGETH") != 0;
    return iResult;
}
