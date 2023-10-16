int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nRumgutGiveUp") != 1)
        return TRUE;
    return FALSE;
}
