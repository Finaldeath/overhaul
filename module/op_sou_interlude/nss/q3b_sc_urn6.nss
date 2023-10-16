// Fairy Dust in the urn

int StartingConditional()
{
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC19") != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
