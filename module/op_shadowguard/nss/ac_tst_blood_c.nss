//Return TRUE if the Blood ritual has not yet been explained.

int StartingConditional()
{
    int iBlood = GetLocalInt(GetModule(), "iGRAD_BLOOD");
    if (iBlood == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
