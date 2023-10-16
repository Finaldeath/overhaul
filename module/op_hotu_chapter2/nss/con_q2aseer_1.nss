int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "DIALOG_STATUS") == 2)
        return TRUE;
    return FALSE;
}
