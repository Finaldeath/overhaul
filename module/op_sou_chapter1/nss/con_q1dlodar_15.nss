//TRUE if Mara is dead
int StartingConditional()
{
    if (GetLocalInt(GetModule(), "Captive_Cook") == 2)
        return TRUE;
    return FALSE;
}
