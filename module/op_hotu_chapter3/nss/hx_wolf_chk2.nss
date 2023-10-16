// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_WOLF_FORM") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
