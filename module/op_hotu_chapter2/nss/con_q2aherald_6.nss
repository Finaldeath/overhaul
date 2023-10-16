int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Started") > 0)
    {

        return TRUE;
    }
    return FALSE;
}
