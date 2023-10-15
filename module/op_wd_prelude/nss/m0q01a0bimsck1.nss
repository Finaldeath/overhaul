int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"SkipTutorial") == 99;
    return iResult;
}
