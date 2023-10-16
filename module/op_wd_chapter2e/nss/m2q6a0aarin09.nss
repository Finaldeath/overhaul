// if the PC speaker is the romance for Aarin, meter 4 or higher

int StartingConditional()
{
    int iRomance = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    if (iRomance > 3)
    {
        return TRUE;
    }
    return FALSE;
}
