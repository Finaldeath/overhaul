int StartingConditional()
{
    if (GetReputation(OBJECT_SELF, GetPCSpeaker()) <= 30)
        return TRUE;

    return FALSE;
}
