// if the PC speaker is friends with Aarin, meter 2 or 3

int StartingConditional()
{
    int iRomance = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    if ((iRomance == 2) || (iRomance == 3))
    {
        return TRUE;
    }
    return FALSE;
}
