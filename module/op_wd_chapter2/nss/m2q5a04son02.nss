int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"Told_Gerrol_Plot") == 1;
    return iResult;
}
