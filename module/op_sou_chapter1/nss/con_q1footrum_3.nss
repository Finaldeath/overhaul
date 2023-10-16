int StartingConditional()
{
    if (GetLocalInt(GetPCSpeaker(), "nTalkedRumgut") != 1)
    {
        SetLocalInt(GetPCSpeaker(), "nTalkedRumgut", 1);
        return TRUE;
    }
    return FALSE;
}
