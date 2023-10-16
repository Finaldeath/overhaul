// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_WOLF_FORM") == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
