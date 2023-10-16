int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(), "NW_G_M3Q04PLOTKLAUTH") != 99;
    return iResult;
}
