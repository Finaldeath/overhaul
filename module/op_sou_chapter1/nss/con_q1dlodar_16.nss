//TRUE if Mara is alive
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 3)
        return TRUE;
    return FALSE;
}
