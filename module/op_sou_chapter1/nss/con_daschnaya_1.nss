int StartingConditional()
{
    if (GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF, "q1bcards")) == TRUE)
        return TRUE;
    return FALSE;
}
