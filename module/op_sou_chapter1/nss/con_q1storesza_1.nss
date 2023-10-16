int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "X1_nTalkedStoreSzaren") != 1)
    {
        SetLocalInt(GetPCSpeaker(), "X1_nTalkedStoreSzaren", 1);
        return TRUE;
    }
    return FALSE;
}
