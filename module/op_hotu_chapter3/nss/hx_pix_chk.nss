// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_PIXIE_FORM") == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
