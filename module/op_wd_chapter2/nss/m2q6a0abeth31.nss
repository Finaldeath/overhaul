int StartingConditional()
{
    int nAlign = GetAlignmentGoodEvil(GetPCSpeaker());
    if (nAlign == ALIGNMENT_EVIL)
    {
        return TRUE;
    }
    return FALSE;
}
