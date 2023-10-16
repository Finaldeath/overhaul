// Guardian check
int StartingConditional()
{
    if(GetLocalInt(GetModule(), "HX_LAST_GUARDIAN_DEAD") != TRUE)
    {
        return TRUE;
    }
    return FALSE;
}
