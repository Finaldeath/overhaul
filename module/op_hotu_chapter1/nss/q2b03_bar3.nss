int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(),"q2b03Ale") == OBJECT_INVALID)
        return FALSE;
    return TRUE;
}
