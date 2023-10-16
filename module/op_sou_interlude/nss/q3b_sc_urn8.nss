// Dragon's Blood in the urn

int StartingConditional()
{
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC17") != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
