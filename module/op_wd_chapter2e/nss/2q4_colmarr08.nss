int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Colmarr_Told_Invention") > 0;
    return iResult;
}
