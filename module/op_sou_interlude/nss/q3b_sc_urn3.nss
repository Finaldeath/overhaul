// has Dragon's Blood and did not place anything else in the urn

int StartingConditional()
{
    // if the urn already has inside a different component - then do not allow the player to place something
    // else
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_GEM006") != OBJECT_INVALID)
        return FALSE;
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC23") != OBJECT_INVALID)
        return FALSE;
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC10") != OBJECT_INVALID)
        return FALSE;
    if(GetItemPossessedBy(OBJECT_SELF, "NW_IT_MSMLMISC19") != OBJECT_INVALID)
        return FALSE;

    // and if the player has the component - return true
    if(GetItemPossessedBy(GetPCSpeaker(), "NW_IT_MSMLMISC17") != OBJECT_INVALID)
        return TRUE;
    return FALSE;
}
