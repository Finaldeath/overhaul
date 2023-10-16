int StartingConditional()
{
    int nLocal = GetLocalInt(GetModule(), "NW_2Q4_BARAM_IS_DEAD");
    int iRoll = d100();
    if (nLocal == 1 && (iRoll < 26))
    {
        return TRUE;
    }
    return FALSE;
}
