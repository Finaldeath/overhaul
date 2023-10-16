// Glendir hasn't told his lie yet

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(), "q3_Glendir_Lie") == 0;
    return iResult;
}
