int StartingConditional()
{
    if (GetReputation(OBJECT_SELF, GetPCSpeaker()) > 30 && GetReputation(OBJECT_SELF, GetPCSpeaker()) <= 70)
        return TRUE;

    return FALSE;
}
