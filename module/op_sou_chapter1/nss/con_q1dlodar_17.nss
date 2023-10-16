//TRUE if Mara is gone with the kobolds
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 1)
        return TRUE;
    return FALSE;
}
