int StartingConditional()
{
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") == 2)
    {
        SetImmortal(OBJECT_SELF, FALSE);
        return TRUE;
    }

    return FALSE;
}
