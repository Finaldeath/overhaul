int StartingConditional()
{
    if (GetLocalInt(GetModule(), GetTag(OBJECT_SELF) + "_N_DONT_LEAVE_PARTY") == 1)
        return TRUE;

    return FALSE;
}
