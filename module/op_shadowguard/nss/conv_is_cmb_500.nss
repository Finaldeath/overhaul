int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "N_COMBINATION") != 500)
        return FALSE;

    return TRUE;
}
