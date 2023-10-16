int StartingConditional()
{
    int iMeter = GetLocalInt(GetPCSpeaker(),"PC_Aribeth_Meter");
    if (iMeter < 0)
    {
        return TRUE;
    }
    return FALSE;
}
