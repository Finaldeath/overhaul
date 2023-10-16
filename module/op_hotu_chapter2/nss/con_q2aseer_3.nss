int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "X2_Q2Battle2Wave2Over") == 1)
    {
        SetImmortal(OBJECT_SELF, FALSE);
        return TRUE;
    }
    return FALSE;
}
