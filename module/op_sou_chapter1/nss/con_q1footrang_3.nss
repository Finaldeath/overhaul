int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_QFootBelowRanger") == 1)
        return TRUE;
    return FALSE;
}
