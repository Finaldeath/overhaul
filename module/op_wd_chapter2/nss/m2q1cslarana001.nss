int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"NW_L_M2LaranaInfo") == 0;
    return iResult;
}
