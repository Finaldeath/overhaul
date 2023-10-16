int StartingConditional()
{
    if (GetItemPossessedBy(GetPCSpeaker(),"q2b03FairyDust") == OBJECT_INVALID)
        return FALSE;
    return TRUE;
}
