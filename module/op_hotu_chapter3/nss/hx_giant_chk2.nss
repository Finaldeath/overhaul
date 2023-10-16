// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_GIANT_FORM") == TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
