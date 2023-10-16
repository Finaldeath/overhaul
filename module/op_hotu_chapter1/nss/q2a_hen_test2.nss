int StartingConditional()
{
    if (GetMaster(OBJECT_SELF) == OBJECT_INVALID)
        return FALSE;
    if (GetMaster(OBJECT_SELF) == GetPCSpeaker())
        return FALSE;
    return TRUE;
}
