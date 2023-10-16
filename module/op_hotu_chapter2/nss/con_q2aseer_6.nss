int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave4Over") == 1)
        return TRUE;
    return FALSE;
}
