int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Talked_To_Aruph") == 1;
    return iResult;
}
