int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter") < 2;
    return iResult;
}
