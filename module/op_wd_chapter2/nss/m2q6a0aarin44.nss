int StartingConditional()
{
    int iRace = GetRacialType(GetPCSpeaker());
    if ((iRace == RACIAL_TYPE_ELF) || (iRace == RACIAL_TYPE_HALFELF))
    {
        return TRUE;
    }
    return FALSE;
}
