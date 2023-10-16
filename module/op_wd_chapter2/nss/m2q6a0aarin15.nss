int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter") > 3;
    return iResult;
}
