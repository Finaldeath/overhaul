// checks to see if the PC in dialogue
// is currently uninjured

int StartingConditional()
{
    int nHP = GetCurrentHitPoints(GetPCSpeaker());
    int nMaxHP = GetMaxHitPoints(GetPCSpeaker());
    if (nHP == nMaxHP)
    {
        return TRUE;
    }
    return FALSE;
}
