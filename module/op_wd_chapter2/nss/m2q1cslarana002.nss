int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2LaranaInfo") == 1;
    return iResult;
}
