int StartingConditional()
{
    if (GetLocalInt(OBJECT_SELF, "nLayOnHands") == 1)
    {
        SetLocalInt(OBJECT_SELF, "nLayOnHands", 0);
        return TRUE;
    }
    return FALSE;
}
