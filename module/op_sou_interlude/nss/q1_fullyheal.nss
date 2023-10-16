// if they have been fully healed

int StartingConditional()
{
    int nMaxHP = GetMaxHitPoints();
    int nCurHP = GetCurrentHitPoints();
    if (nMaxHP == nCurHP)
    {
        return TRUE;
    }
    return FALSE;
}
