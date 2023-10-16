
int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nPosted") != 1)
        return TRUE;
    return FALSE;
}
