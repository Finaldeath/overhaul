// Check form.
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_SEEN_GIANT_FORM") == FALSE)
    {
        return TRUE;
    }
    return FALSE;
}
