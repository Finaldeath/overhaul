int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"IDENTIFIED_IN_BLACKLAKE");
    if (iResult == 1)
    {
        return TRUE;
    }
    return FALSE;
}
