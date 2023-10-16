//Return true after the first battle has been lost
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "X2_Q2ABattle1Lost") == 1)
    {
        SetLocalInt(OBJECT_SELF, "X2_Q2ABattle1Lost", 2);
        return TRUE;
    }
    return FALSE;
}
