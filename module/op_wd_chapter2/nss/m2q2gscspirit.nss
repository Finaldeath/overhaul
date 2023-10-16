int StartingConditional()
{
    int iResult = GetLocalInt(GetPCSpeaker(),"NW_M2Q2E_LFINDSPIRIT");
    if (iResult == 30)
    {
        return TRUE;
    }
    return FALSE;
}
