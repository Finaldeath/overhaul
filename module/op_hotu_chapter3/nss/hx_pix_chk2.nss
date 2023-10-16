// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_PIXIE_FORM") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
