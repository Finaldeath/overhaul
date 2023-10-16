// if the PC speaker is the romance for Aarin, meter 4 or higher

// * BRENT: I changed the iRomance > 3 based on

int StartingConditional()
{
    int iRomance = GetLocalInt(GetPCSpeaker(),"PC_Aarin_Meter");
    if (iRomance > 5)
    {
        return TRUE;
    }
    return FALSE;
}
