int StartingConditional()
{
    if (GetReputation(OBJECT_SELF, GetPCSpeaker()) > 80)
        return TRUE;

    return FALSE;
}
