int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "Generic_Surrender") == 1)
        return TRUE;
    return FALSE;
}
